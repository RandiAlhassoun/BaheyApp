//
//  Logout.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct Logout: View {
    var body: some View {
       // NavigationView {
            
        
            VStack{
                Image("Logout")
                    .resizable()
                    .frame(width: 256.67, height: 250)
                    .padding()
                Text("Signed out successfully ")
                    .modifier(EmptyStateTextModifier())
                
                    .padding()
                
               // NavigationLink(destination: Explore().navigationBarBackButtonHidden()){
                    Text("OK")//}
                    .modifier(MediemButtonModifier())
                    .bold()
                    .padding()
                
           // }
            
        }
    }
}

struct Logout_Previews: PreviewProvider {
    static var previews: some View {
        Logout()
    }
}
