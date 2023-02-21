

//
//  Login.swift
//  Bahey1
//
//  Created by salma alorifi on 17/07/1444 AH.
//

import SwiftUI
import FirebaseAuth
import AuthenticationServices
import CryptoKit


struct Login: View {
    @State var currentNonce:String?
    
    //Hashing function using CryptoKit
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
        return String(format: "%02x", $0)
        }.joined()

        return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: Array<Character> =
          Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
//    @Environment(\.colorScheme) var colorScheme
    
    
    // add variable for email , password
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var isLogin = false
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
    @State var toExplore = false
    @State var toSignUp = false
    @State var toSignInWithAppleButton = false
    
    struct AppleUser: Codable {
        let userId: String
        let firstName: String
        let lastName: String
        let email: String
        
        init?(credentials: ASAuthorizationAppleIDCredential) {
            guard
                let firstName = credentials.fullName?.givenName,
                let lastName = credentials.fullName?.familyName,
                let email = credentials.email
            else { return nil }
            
            self.userId = credentials.user
            self.firstName = firstName
            self.lastName = lastName
            self.email = email
        }
    }
    
    var body: some View {
        
        
        NavigationView{ // start Navigation View
            
            VStack(){ // start Vstack
                
                
                // MARK: - Titel
                
                Text("Sing In").modifier(XLTextModifier())
                Spacer()
                
                // MARK: - TextField
                
                VStack(alignment:.leading){
                    Text("Email")
                    // .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                    
                    TextField("Example@example.com", text: $email)
                        .padding()
                        .background(Color("Lgreen"))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    
                    Text ("Password")//This is only fr me.
                    //.multilineTextAlignment(.leading).csl
                        .fontWeight(.semibold)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color("Lgreen"))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    if !signInErrorMessage.isEmpty {
                        Text("Could not sign in user: \(signInErrorMessage)")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.red)
                    }
                }
                
                // MARK: - Sign in button

                

                //                NavigationLink(destination: Explore().navigationBarBackButtonHidden()){
                //                    Text("Sign In")
                //                        .modifier(LargeButtonModifier())
                //                        .padding()
                //                }
                
               

                Button {
                    signInUser(email: email, password: password)
                    print("Sign In Button clicked")
                } label: {
                    Text("Sign In").modifier(LargeButtonModifier())
                        .padding()
                    
                    
                }
                Text("OR")
                
                // MARK: - Sign in with apple button
//                Button {
//
//                } label: {
//                    Text("Sign in with Apple").modifier(LargeButtonModifier1())
//                }.padding()
                
//                SignInWithAppleButton(
//                            .signIn,
//                            onRequest: configure,
//                            onCompletion: handle
//                        )
//                        .signInWithAppleButtonStyle(
//                            colorScheme == .dark ? .white : .black
//
//                        )
//                        .modifier(LargeButtonModifier())
////                        .frame(height: 45)
//                        .padding()
                SignInWithAppleButton(
                                     
                                     //Request
                                     onRequest: { request in
                                         let nonce = randomNonceString()
                                         currentNonce = nonce
                                         request.requestedScopes = [.fullName, .email]
                                         request.nonce = sha256(nonce)
                                     },
                                     onCompletion: { result in
                                                               switch result {
                                                                   case .success(let authResults):
                                                                       switch authResults.credential {
                                                                           case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                                                           
                                                                                   guard let nonce = currentNonce else {
                                                                                     fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                                                                   }
                                                                                   guard let appleIDToken = appleIDCredential.identityToken else {
                                                                                       fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                                                                   }
                                                                                   guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                                                                     print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                                                                     return
                                                                                   }
                                                                                  
                                                                                   let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                                                                   Auth.auth().signIn(with: credential) { (authResult, error) in
                                                                                       if (error != nil) {
                                                                                           // Error. If error.code == .MissingOrInvalidNonce, make sure
                                                                                           // you're sending the SHA256-hashed nonce as a hex string with
                                                                                           // your request to Apple.
                                                                                           print(error?.localizedDescription as Any)
                                                                                           return
                                                                                       }
                                                                                       print("signed in")
                                                                                   }
                                                                           
                                                                               print("\(String(describing: Auth.auth().currentUser?.uid))")
                                                                           
                                                                       default:
                                                                           break
                                                                                   
                                                                               }
                                                                      default:
                                                                           break
                                                                   }
                                         toSignInWithAppleButton.toggle()
                                                           }
                                                       ) .modifier(LargeButtonModifier())
                
                
                
                
                // MARK: - Register link
                HStack{
                    
                    Text("Don’t have an account?")
                    Button {
                        toSignUp.toggle()
                    } label: {
                        Text("Sign Up").foregroundColor(Color("Dpink"))
                    }.foregroundColor(Color("Dpink"))
                        .navigationBarBackButtonHidden()
                }
                Spacer()
                
            }// end Vstack
            
            .fullScreenCover(isPresented: $toExplore) {
                TabBar()
            }//fullScreenCover
            .fullScreenCover(isPresented: $toSignUp) {
                SignUp()
                
            }//fullScreenCover
            .fullScreenCover(isPresented: $toSignInWithAppleButton) {
            TabBar()
        }
            .padding()
        }//end Navigation View
    }
    // MARK: -  func signInUser() using Firebase.
    func signInUser(email: String, password: String) {
        signInProcessing = true
        print("Inside func signIn()")
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            // MARK: -  NOTE: This if to get the user name of the user.
            
            if let user = authResult?.user {
                let username = user.displayName
                print("Username: \(username)")
            } //End of if
            
            guard error == nil else {
                signInProcessing = false
                signInErrorMessage = error!.localizedDescription
                return
            }
            print("User signed in")
            toExplore = true
            signInProcessing = false
            withAnimation {
                //viewRouter.currentPage = .homePage
            }
//            switch authResult {
//            case .none:
//                print("Could not sign in user.")
//                signInProcessing = false
//            case .some(_):
//
//            }
//
            
        }
    }
//    func configure(_ request: ASAuthorizationAppleIDRequest) {
//            request.requestedScopes = [.fullName, .email]
//    //        request.nonce = ""
//        }
//
//        func handle(_ authResult: Result<ASAuthorization, Error>) {
//            switch authResult {
//            case .success(let auth):
//                print(auth)
////                toSignInWithAppleButton.toggle()
//                switch auth.credential {
//                case let appleIdCredentials as ASAuthorizationAppleIDCredential:
//                    if let appleUser = AppleUser(credentials: appleIdCredentials),
//                       let appleUserData = try? JSONEncoder().encode(appleUser) {
//                        UserDefaults.standard.setValue(appleUserData, forKey: appleUser.userId)
//
//                        print("saved apple user", appleUser)
//
//
//                    } else {
//                        print("missing some fields", appleIdCredentials.email, appleIdCredentials.fullName, appleIdCredentials.user)
//
//                        guard
//                            let appleUserData = UserDefaults.standard.data(forKey: appleIdCredentials.user),
//                            let appleUser = try? JSONDecoder().decode(AppleUser.self, from: appleUserData)
//
//                        else { return }
//
//                        print(appleUser)
//                    }
//
//                default:
//                    print(auth.credential)
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//
//        }
//
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
//            .preferredColorScheme(.light)
    }
}

//edit g


// MARK: - Had to add a new modifier for Sign in with apple button

struct LargeButtonModifier1: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .frame(width: 365 , height: 42)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(5.0)
            .font(.system(size: 20))
    }}




