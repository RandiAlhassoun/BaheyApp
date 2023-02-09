//
//  AfterReview.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct AfterReview: View {
    @State var toViewAllReviews = false
    var body: some View {
        
        VStack(){//main VStack
            Image ("AfterReview")
                .resizable()
                .frame(width: 250, height: 250)
            Text("Your review has been submitted successfully")
                .modifier(EmptyStateTextModifier())
                .multilineTextAlignment(.center)
                .padding(.vertical, 50.0)
            
            Button {
                toViewAllReviews.toggle()
            } label: {
                Text("Done")
                
            }.modifier(MediemButtonModifier())
        }//End of main VStack
        .fullScreenCover(isPresented: $toViewAllReviews) {
            ViewAllReviews()
        }
    }//End of body
}//End of struct AfterReview

struct AfterReview_Previews: PreviewProvider {
    static var previews: some View {
        AfterReview()
    }
}
