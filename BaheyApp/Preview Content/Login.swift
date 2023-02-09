

//
//  Login.swift
//  Bahey1
//
//  Created by salma alorifi on 17/07/1444 AH.
//

import SwiftUI


// had to add a new modifier for Sign in with apple button

struct LargeButtonModifier1: ViewModifier {
    func body(content: Content) -> some View {
        content
        //.bold()
            .frame(width: 365 , height: 42)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(5.0)
            .font(.system(size: 20))
    }}


struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView{
        
            VStack(){
                
                // MARK: - Titel
                Text("Sing In").modifier(XLTextModifier())
                    //.padding(.vertical, 50.0)
                Spacer()
                
                VStack(alignment:.leading){
                    // MARK: - TextField
                    
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
                Text("Sign In")
                    .modifier(LargeButtonModifier())
                    .padding()
                 }
                
                Text("OR")

                /* SignInWithAppleButton(
                 onRequest: { request in
                 /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                 },
                 onCompletion: { result in
                 /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                 }
                 )*/
                

                
                Button {
                } label: {
                    Text("Sign in with Apple").modifier(LargeButtonModifier1())
                }             
                .padding()
                
                
                
                // MARK: - Register link
                HStack{


                    Text("Don’t have an account?")
                    NavigationLink(destination: SignUp()){
                        Text("Sign up")
                    }.foregroundColor(Color("Dpink"))
                }
              Spacer()
              
            }
            .padding()
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}





