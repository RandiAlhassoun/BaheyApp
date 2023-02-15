

//
//  Login.swift
//  Bahey1
//
//  Created by salma alorifi on 17/07/1444 AH.
//

import SwiftUI


struct Login: View {
    
    // add variable for email , password
    
    @State var email: String = ""
    @State var password: String = ""
    
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
                    
                    Text ("Password")
                        //.multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color("Lgreen"))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                }
                
                // MARK: - Sign in button
                
                NavigationLink(destination: TabBar().navigationBarBackButtonHidden()){
                    Text("Sign In")
                    .modifier(LargeButtonModifier())
                    .padding()
                }
                Text("OR")
                
                // MARK: - Sign in with apple button
                Button {
                } label: {
                    Text("Sign in with Apple").modifier(LargeButtonModifier1())
                }.padding()
                
            
                // MARK: - Register link
                HStack{
                    
                    Text("Don’t have an account?")
                    NavigationLink(destination: SignUp().navigationBarBackButtonHidden()){
                        Text("Sign up")
                    }.foregroundColor(Color("Dpink"))
                }
                Spacer()
                
            }// end Vstack
            .padding()
            
        }//end Navigation View
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}




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



