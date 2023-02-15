//
//  AfterReview.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct AfterReview: View {
    @State var toProviderInfo = false //To go to ProviderInfo after clicking Done button.
    var body: some View {
        
        VStack(){//main VStack
            Image ("AfterReview")
                .resizable()
                .frame(width: 250, height: 250)
            Text("Your review has been submitted successfully")
                .frame(maxWidth: .infinity)
                .modifier(EmptyStateTextModifier())
                .multilineTextAlignment(.center)
                .padding(.vertical, 50.0)
                .padding(.horizontal)
            Button {
                toProviderInfo.toggle()
            } label: {
                Text("Done")
                
           }.modifier(MediemButtonModifier())
        }//End of main VStack
        
        .fullScreenCover(isPresented: $toProviderInfo) {
            ProviderInfo()
        }//End of fullScreenCover
    }//End of body
}//End of struct AfterReview

struct AfterReview_Previews: PreviewProvider {
    static var previews: some View {
        AfterReview()
    }
}
