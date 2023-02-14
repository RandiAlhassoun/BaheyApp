//
//  ViewAllReviews.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct ViewAllReviews: View {
    @State var showWriteReviewSheet = false
    var body: some View {
        VStack( ){
            ScrollView{
                VStack(alignment: .leading){
                    // Reviewer name:
                    Text("Shahd")
                        .modifier(RegularTextModifier())
                        .bold()
                        .padding([.top, .leading, .trailing])
                    // Reviewer evaluation stars:
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("yellowFill"))
                        .padding(.horizontal)
                    // Reviewer review:
                    Text("shhkkwkewkejelqljkkkkkkkkkkkkklllkallaklkakkaksalkslaksalsababhahahabhabhabhajajajajajjaajajajajaqwlqjeqlwjlqljwjlqjwlqjdsdkajd")
                        .modifier(RegularTextModifier())
                        .padding(.horizontal)
                    Spacer()
                }
                //Modifiers to make the VStack as a block
                .modifier(reviewBackgrounddModifier())
                
                Button {
                    
                    showWriteReviewSheet.toggle()
                    
                } label: {
                    Text("Add a review")
                        .modifier(LargeButtonModifier())
                }.sheet(isPresented: $showWriteReviewSheet) {
                    WriteReview()
                }
                
            }//End of VStack review block
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding(.horizontal)
        }
    }
}

struct ViewAllReviews_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllReviews()
    }
}
