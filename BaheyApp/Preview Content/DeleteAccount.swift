//
//  DeleteAccount.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct DeleteAccount: View {
    var body: some View {
       // NavigationView{
            VStack{
                Image("DeleteAccount")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding()
                Text("Your account has been deleted scssfly ")
                    .modifier(EmptyStateTextModifier())
                
                    .padding()
                
               // NavigationLink(destination: Explore().navigationBarBackButtonHidden()){
                    Text("OK")//}
                    .modifier(MediemButtonModifier())
                    .bold()
                    .padding()
            //}
        }
    }
}

struct DeleteAccount_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccount()
    }
}
