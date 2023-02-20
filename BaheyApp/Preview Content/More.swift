//
//  More.swift
//  Bahey1
//
//  Created by salma alorifi on 17/07/1444 AH.
////
//  More.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI
import Firebase


struct More: View {
    
    
    @State private var showingOptions = false
    @State private var UserLogedOut = false
    @State var signOutProcessing = false
    @State private var isDeleting = false
    var body: some View {
        
        NavigationView{ //start Navigation View
            VStack(alignment: .leading){ // start v stack
                
                // MARK: - heeder
                VStack(alignment:.leading){
                    let CurrentUserName = Auth.auth().currentUser?.displayName
                    Text("Hello, \(CurrentUserName ?? "User")")//To get the email of the current user or else set the email to "User"
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                    let CurrentUserEmail = Auth.auth().currentUser?.email
                    Text ("\(CurrentUserEmail ?? "User@email.com")")//To get the email of the current user or else set the email to "User@email.com"
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                    
                    
                }.padding()
                
                Spacer()
                HStack(){ //hstack for contect us with action button
                    Image(systemName:"envelope.fill")
                        .resizable()
                        .frame(width: 28, height: 24)
                        .foregroundColor(.gray)
                    Button("Cntact Us"){
                        showingOptions = true
                    }.modifier(RegularTextModifier()).bold()
                        .confirmationDialog("Connect by email", isPresented: $showingOptions, titleVisibility: .visible) {
                            Button("BaheyApp@gmail.com") {}
                        }
                } // end hstack
                .padding()
                
                HStack(){ // hstack with link to about us
                    NavigationLink(destination: AboutUs()){
                        Image(systemName:"bubble.left.and.bubble.right.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.gray)
                        Text("About us").modifier(RegularTextModifier()).bold()
                        //Spacer()
                    }
                } // end hstack
                .padding()
                HStack(){ // hstack with link to add Business
                    NavigationLink(destination: AddBusiness()){
                        Image(systemName:"newspaper.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.gray)
                        Text("Add Your Business").modifier(RegularTextModifier()).bold() }
                    
                }// end hstack
                .padding()
                
                
                
                Spacer()
                // MARK: - Sign out Button:
                Button {
                    
                    signOutUser()
                    print("Sign out Button clicked")
                } label: {
                    Text("Sign Out").modifier(LargeButtonModifier())
                }
                // MARK: - Sign out Button:
                //                NavigationLink(destination: DeleteAccount().navigationBarBackButtonHidden()
                //                ){
                //                    Text("Delete Account")
                //                        .modifier(LargeButtonModifier())
                //                }
                Button {
                    deleteAccount()
                    print("Delete Account Button clicked")
                } label: {
                    Text("Delete Account").modifier(LargeButtonModifier())
                }
                
                Spacer()
                
                
            }
            .padding()
            .fullScreenCover(isPresented: $UserLogedOut) {
                Logout()
                
            }
            .fullScreenCover(isPresented: $isDeleting) {
                DeleteAccount()
            }
            
            //.navigationBackButton(color: UIColor(red: 0.73, green: 0.41, blue: 0.43, alpha: 1.00),  text: "Back") //To use a custom color you have to get the UIColor from the hex using this website:https://www.uicolor.io
            
            //Modifiers to make the VStack as a block
            // .modifier(reviewBackgrounddModifier())
        }
    }
    // MARK: - Sign out func:
    func signOutUser() {
        print("Inside func signOutUser()")
        signOutProcessing = true
        let firebaseAuth = Auth.auth()
        print("Current User that will log out : \(firebaseAuth.currentUser?.displayName)")
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            signOutProcessing = false
        }
        withAnimation {
            //go to some view
            //viewRouter.currentPage = .signInPage
        }
        UserLogedOut = true
    }// End of func signOutUser()
    
    // MARK: - delete Account func:
    func deleteAccount() {
        
        self.isDeleting = true
        
        let user = Auth.auth().currentUser
        print("UserName to be deleted \(user?.displayName)")
        
        user?.delete { error in  //asynchronous call to delete the user from firebase auth
            
            if let error = error {  //if there was an error deleting the user, print it to the console
                
                print("Error deleting user: \(error)")  //print the error to the console
                
            } else {   //if there was no error, print a success message to the console
                
                print("User successfully deleted")   //print success message to the console
                
            }   //end if/else statement
            
        }   //end delete closure
        
    }   //end deleteAccount function
}


struct More_Previews: PreviewProvider {
    static var previews: some View {
        More()
    }
}


