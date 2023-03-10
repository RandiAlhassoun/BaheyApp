//
//  DeleteAccount.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct DeleteAccount: View {
    @State var toMoreAfterDelete = false
    var body: some View {
        //
        VStack{// start vstack
            // MARK: - image
            
            Image("DeleteAccount")
                .resizable()
                .frame(width: 250, height: 250)
                .padding()
            
            // MARK: - texts
            
            Text("Your account has been deleted scssfly ")
                .modifier(EmptyStateTextModifier())
                .padding()
            
            // MARK: - button will be sent to explore page
            
            Button {
                toMoreAfterDelete.toggle()
            } label: {
                Text("Done")
                
            }.modifier(MediemButtonModifier())
                .bold()
                .padding()
        }//end vstack
        .fullScreenCover(isPresented:$toMoreAfterDelete ){
            TabBar()
        }//fullScreenCover
        // .navigationBackButton(color: UIColor(red: 0.73, green: 0.41, blue: 0.43, alpha: 1.00),  text: "Back")
        
        
    }}

struct DeleteAccount_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccount()
    }
}
