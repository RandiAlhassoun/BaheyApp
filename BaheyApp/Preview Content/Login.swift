

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
            .font(.system(size: 20))
            .background(Color.black)
            .frame(width: 365 , height: 42)
            .cornerRadius(5.0)
            .foregroundColor(.white)
    }}


struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                
                // MARK: - Titel
                Text("تسجيل الدخول").modifier(XLTextModifier())
                    .padding()
                
                //Spacer()
                
                
                
                // MARK: - TextField
                
                Text("البريد الإلكتروني").modifier(RegularTextModifier())
                    .fontWeight(.black)
        
                TextField("example@example.com", text: $email)
                
                    .padding()
                    .background(Color("Lgreen"))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.trailing)
                
                
                
                Text ("كلمة المرور").modifier(RegularTextModifier())
                        .fontWeight(.black)
                SecureField("كلمة المرور", text: $password)
                    .padding()
                    .background(Color("Lgreen"))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.trailing)
                

                
                // MARK: - Button
                
                
                NavigationLink(destination: Explore()){
                    Text("تسجيل دخول").modifier(LargeButtonModifier())
                        .font(.system(size: 20))
                        .background(Color("Dpink"))
                        .frame(width: 365 , height: 42)
                        .cornerRadius(5.0)
                        .foregroundColor(.white)
                        .padding()
                }
                
                Text("او")
                
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
                    Text("تسجيل الدخول باستخدام آبل").modifier(LargeButtonModifier1())
                }
                .font(.system(size: 20))
                .background(Color.black)
                .frame(width: 365 , height: 42)
                .cornerRadius(5.0)
                .foregroundColor(.white)
                .padding()
                
                
                
                // MARK: - Register link
                HStack{
                    NavigationLink(destination: SignUp()){
                        Text("انشي حساب")
                    }.foregroundColor(Color("Dpink"))
                    
                    Text("ليس لديك حساب ؟")
                    
                    
                }
                
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



