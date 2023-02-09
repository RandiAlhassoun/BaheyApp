//
//  SignUp.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct SignUp: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        
        VStack{
            // MARK: - Titel
            Text("Sing up").modifier(XLTextModifier())
            //.padding(.vertical, 50.0)
            Spacer()
            
            
            // MARK: - TextField
            VStack(alignment:.leading){
                
                Text("Username")
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                //.modifier(RegularTextModifier())
                
                TextField("Username", text: $email)
                    .padding()
                    .background(Color("Lgreen"))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                Text("Email")
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                // .modifier(RegularTextModifier())
                
                TextField("Example@example.com", text: $email)
                    .padding()
                    .background(Color("Lgreen"))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                //.multilineTextAlignment(.leading)
                
                Text ("Password")
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                //.modifier(RegularTextModifier())
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("Lgreen"))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                //.multilineTextAlignment(.leading)
                
            }
            
            // MARK: - Button
            
            
            NavigationLink(destination: Explore()){
                Text("Create account").modifier(LargeButtonModifier())
                    .padding()
            }
            HStack{
                Text("Already have an account? ")
                NavigationLink(destination: Login()){
                    Text("Sign In")
                }.foregroundColor(Color("Dpink"))
            }
            Spacer()
        }
        .padding()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
