//
//  SignUp.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI
import Firebase

struct SignUp: View {
    // add variable for email , password , username
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var toExplore = false
    @State var toLogin = false
    @State var signUpProcessing = false
    @State var signUpErrorMessage = ""
    
    var body: some View {
        
        VStack{
            // MARK: - Titel
            Text("Sign up").modifier(XLTextModifier())
            //.padding(.vertical, 50.0)
            Spacer()
            
            // MARK: - TextField
            VStack(alignment:.leading){
                
                // username field
                Text("Username")
                    .fontWeight(.semibold)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color("Lgreen"))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                //email field
                Text("Email")
                    .fontWeight(.semibold)
                
                TextField("Example@example.com", text: $email)
                    .padding()
                    .background(Color("Lgreen"))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                // password field
                Text ("Password")
                    .fontWeight(.semibold)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("Lgreen"))
                    .cornerRadius(5.0)
                .padding(.bottom, 20)
                // MARK: - ProgressView & Error msg
                VStack(alignment: .center){
                    if signUpProcessing {
                        //ProgressView shown means that there are things performd in the backend
                        ProgressView()
                    }
                    if !signUpErrorMessage.isEmpty {
                        //To show the error msg to the user ex: not matched, email already used...
                        Text("Failed creating account: \(signUpErrorMessage)")
                            .multilineTextAlignment(.center)
                            //.frame(height:50)
                            .foregroundColor(.red)
                        // .padding()
                    }
                }//End of VStack ErrorMessag & ProgressView
            } // end of second vstack
            
            // MARK: - Button
            //Spacer()
            
            Button {
                signUpUser()
                print("Create account Button clicked")
            } label: {
                
                Text("Create account").modifier(LargeButtonModifier())
                    
                    .padding(.vertical,20)
            }//End of Button Lable.
            
            
            // MARK: - Login link
            HStack{
                Text("Already have an account? ")
                Button {
                    toLogin.toggle()
                } label: {
                    Text("Sign In").foregroundColor(Color("Dpink"))
                }//End of button Lable
            }//End of HStack
            Spacer()
        }// end main vstack
        .fullScreenCover(isPresented: $toExplore) {
            TabBar()
        }//fullScreenCover
        .fullScreenCover(isPresented: $toLogin) {
            Login()
        }//fullScreenCover used to fo to Login if Already have an account?
        
        .padding()
        // .navigationBackButton(color: UIColor(red: 0.73, green: 0.41, blue: 0.43, alpha: 1.00),  text: "Back") //To use a custom color you have to get the UIColor from the hex using this website:https://www.uicolor.io
        
        //Modifiers to make the VStack as a block
        //.modifier(reviewBackgrounddModifier())
    }
    
    // MARK: -  func signUpUser() used to create a user using Firebase.
    
    public func signUpUser() {
        signUpProcessing = true
        print("inside signUpUser()")
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {  //error handling
                print("Failed to sign up user with error \(error.localizedDescription)")  //print the error message to console
                signUpErrorMessage = error.localizedDescription
                signUpProcessing = false
                return  //return out of the function
            } else { //if no errors occur
                
                let changeRequest = authResult?.user.createProfileChangeRequest() //create a profile change request object using the user object from the result of creating a new user
                changeRequest?.displayName = self.username //set the display name of the user to be equal to the username entered by the user
                
                // MARK: -  NOTE: This if to get the user name of the user.
                
                if let user = authResult?.user {
                    let username = user.displayName
                    print("Username: \(self.username)")
                } //End of if
                
               
                changeRequest?.commitChanges(completion: { (error) in //commit changes to firebase auth
                    
                    if let error = error { //error handling
                        print("Failed to commit changes with error \(error.localizedDescription)") //print out an error message to console
                        return //return out of the function
                    } else { //if no errors occur
                        
                        print("Successfully signed up user and committed changes") //print out success message to console
                        signUpProcessing = false
                        toExplore = true
                    }//End of else
                    
                }//End of changeRequest
                )//End of completion:
                
            }//End of else
            
        }//End of Auth.auth().createUser
        
    }//End of func
}//End of struct SignUp


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
