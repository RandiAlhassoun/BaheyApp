//
//  AddBusiness.swift
//  Bahey1
//
//  Created by salma alorifi on 17/07/1444 AH.
//

import SwiftUI

struct AddBusiness: View {
    
    @State private var showingOptions = false
    
    var body: some View {
        
        VStack(alignment: .center){
            // start of Vstack
        
            // MARK: - image
            Image("AddBusiness")
                .resizable()
                .frame(width: 250, height: 250)
                .padding()
            
            // MARK: - texts
            Text("You can contact us by e-mail to view your personal project")
                .modifier(EmptyStateTextModifier())
                .padding()
            
            // MARK: - email action button
            VStack(alignment: .center){
                Button(){
                    showingOptions = true
                } label: {
                    Image("mail") // <- Change icon to your preferred one
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.blue)
                        .modifier(RegularTextModifier()).bold()
                        .confirmationDialog("Connect by email", isPresented: $showingOptions, titleVisibility: .visible) {
                            Button("BaheyApp@gmail.com") {}
                        }
                }
                Spacer()
            }
        
        }// end of Vstack
        .navigationTitle("Add Your Business")
            .modifier(XLTextModifier())
            .padding()
        
    }
}


struct AddBusiness_Previews: PreviewProvider {
    static var previews: some View {
        AddBusiness()
    }
}

