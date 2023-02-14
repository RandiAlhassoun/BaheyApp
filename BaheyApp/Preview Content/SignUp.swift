//
//  SignUp.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct SignUp: View {
    // add variable for email , password , username
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
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
                
            } // end of second vstack
            
            // MARK: - Button
            
            NavigationLink(destination: Explore().navigationBarBackButtonHidden()){
                Text("Create account").modifier(LargeButtonModifier())
                    .padding()
            }
            
            // MARK: - Login link
            HStack{
                Text("Already have an account? ")
                NavigationLink(destination: Login()){
                    Text("Sign In")
                }.foregroundColor(Color("Dpink"))
            }
            Spacer()
        }// end main vstack
        .padding()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
