

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
              
                    Text("تسجيل الدخول")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding()
                
                    
                
                
                    Text("البريد الإلكتروني")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                    
                    TextField("الإيميل", text: $email)
                        .padding()
                        .background(Color("Lgreen"))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    
                Text ("كلمة المرور")
                    .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                
                    SecureField("كلمة المرور", text: $password)
                        .padding()
                        .background(Color("Lgreen"))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                       
             
                    Button {
                    } label: {
                        Text("تسجيل دخول").modifier(LargeButtonModifier())
                    }.font(.system(size: 20))
                        .background(Color("Dpink"))
                        .frame(width: 365 , height: 42)
                        .cornerRadius(5.0)
                        .foregroundColor(.white)
                        .padding()
                    
                    Text("او")
                    
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
                    
                  
                        
                        
                        NavigationLink {
                            SignUp()
                        } label: {
                            Text(" ليس لديك حساب ؟ انشئ حساب")
                                .foregroundColor(Color.black)
                            
                        }
                        .padding()
                    
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



