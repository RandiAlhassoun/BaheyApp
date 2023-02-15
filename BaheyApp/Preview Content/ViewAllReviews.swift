//
//  ViewAllReviews.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct ViewAllReviews: View {
    //@State var showWriteReviewSheet = false
    var body: some View {
        
        //Main VStack that holds all the elements of the view.
        VStack{
            ScrollView{
                //All the reviews blocks:
                ForEach(1...7, id: \.self) { i in
                    LargeReviewBlockView()
                }
                
            }//End of ScrollView that conatians all the reviews.
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding(.horizontal)
            
            //Calling Add a review button view
            AddReviewButton()
            
        }
        
    }
}

struct ViewAllReviews_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllReviews()
    }
}


struct LargeReviewBlockView: View {
    @State var showWriteReviewSheet = false
    var body: some View {
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
                .font(.system(size: 15))
            // Reviewer review:
            Text("shhkkwkewkejelqljkkkkkkkkkkkkklllkallaklkakkaksalkslaksalsababhahahabhabhabhajajajajajjaajajajajaqwlqjeqlwjlqljwjlqjwlqjdsdkajd")
                .modifier(RegularTextModifier())
                .padding(.horizontal)
            Spacer()
        }.navigationTitle("Rating and Reviews")
        //navigationBackButton Modifier that creates a back button with custom ccolor.
            .navigationBackButton(color: UIColor(red: 0.73, green: 0.41, blue: 0.43, alpha: 1.00),  text: "Back") //To use a custom color you have to get the UIColor from the hex using this website:https://www.uicolor.io
        
        //Modifiers to make the VStack as a block
            .modifier(reviewBackgrounddModifier())
    }}

struct AddReviewButton: View {
    @State var showWriteReviewSheet = false
    var body: some View {
        Button {
            showWriteReviewSheet.toggle()
        } label: {
            Text("Add a review")
                .modifier(LargeButtonModifier())
        }.sheet(isPresented: $showWriteReviewSheet) {
            WriteReview()//Calling WriteReview() view to be displayed after clicking the button.
                .presentationDetents([.medium , .large])
                .presentationDragIndicator(.visible)
        }
    }}
