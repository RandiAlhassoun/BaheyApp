//
//  AddBusiness.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct AddBusiness: View {
    var body: some View {
        VStack{
            Text("Add Your Business")
                .modifier(XLTextModifier())
                .padding()
         
            Image("AddBusiness")
                .resizable()
                .frame(width: 250, height: 250)
                 .padding()
            Text("You can contact us by e-mail to view your personal project")
                .modifier(EmptyStateTextModifier())
                .padding()
            
            Image("mail")
                .resizable()
                .frame(width: 60, height: 60)
                .padding()
            
            Spacer()
              
        }
    }
}

struct AddBusiness_Previews: PreviewProvider {
    static var previews: some View {
        AddBusiness()
    }
}
