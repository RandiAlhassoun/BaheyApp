//
//  AfterReview.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct AfterReview: View {
    var body: some View {
        VStack(){
            VStack(){
                Image ("AfterReview")
                    .resizable()
                .frame(width: 300, height: 300)}
            
            Text("تم اضافة تقييمك بنجاح").modifier(EmptyStateTextModifier())
                .padding(.top, 50.0)
            Button {
            print("Button was tapped")
           } label: {
            Text("تم")
                
           }.frame(width: 165 , height: 45)
                .foregroundColor(.white)
                .background(Color("Dpink")
                .cornerRadius(15.0)
           .font(.system(size: 20))
                )
                
                            //.multilineTextAlignment(.center)
            
        }
    }
}

struct AfterReview_Previews: PreviewProvider {
    static var previews: some View {
        AfterReview()
    }
}
