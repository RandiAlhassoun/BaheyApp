//
//  Logout.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct Logout: View {
    @State var toMoreAfterLogout = false
    var body: some View {
        VStack{ // start vstack
            // MARK: - image
            
            Image("Logout")
                .resizable()
                .frame(width: 256.67, height: 250)
                .padding()
            
            // MARK: - texts
            
            Text("Signed out successfully ")
                .modifier(EmptyStateTextModifier())
                .padding()
            
            // MARK: - button link to explor page
            
            Button {
                toMoreAfterLogout.toggle()
            } label: {
                Text("Done")
                
            }.modifier(MediemButtonModifier())
                .bold()
                .padding()
        }//end vstack
        .fullScreenCover(isPresented:$toMoreAfterLogout ){
            TabBar()
        }//fullScreenCover
    }//End of body
    
}//End of struct Logout

struct Logout_Previews: PreviewProvider {
    static var previews: some View {
        Logout()
    }
}
