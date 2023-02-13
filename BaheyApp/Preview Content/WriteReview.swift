//
//  WriteReview.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct WriteReview: View {
    @State var feildValue = ""
    @State var toAfterReview = false //To go to ViewAllReviews after clicking Done button.
    let maxCharacters = 50
    @State var isFavoritePressed = false

    var body: some View {
        VStack(){
            //            Spacer()
            //            Text("Add a review")
            VStack(alignment: .leading){
                Spacer()
                Text("Your Evaluation").modifier(WriteReviewHeadersModifier())
                    .padding(.bottom)
                
                HStack{
                    ForEach(1...5, id: \.self) { i in
                        Image(systemName: "star")
                    }}.padding(.bottom)
                Text("Write Your Review").modifier(WriteReviewHeadersModifier())
                    .padding(.bottom)
                
                TextField("",
                          text: $feildValue ,  axis: .vertical)//axis parameter supports more advanced behaviors, like reserving a minimum amount of space and expanding as more content is added, and then scrolling once the content exceeds the upper limit
                .modifier(reviewTextFieldModifier())
                .overlay(Text("\(maxCharacters - feildValue.count) characters remaining") .foregroundColor(.gray))
                .disabled(feildValue.count >= maxCharacters)
                
                Spacer()
                Button {
                    
                    toAfterReview.toggle()
                    
                } label: {
                    Text("Submit")
                    //.modifier(LargeButtonModifier())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .background(Color("Dpink"))
                        .cornerRadius(10.0)
                    
                }
                Text("Submit")
                    .modifier(LargeButtonModifier())
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .leading)
                .padding()
                .fullScreenCover(isPresented: $toAfterReview) {
                    AfterReview()
                }//End of fullScreenCover
        }
    }
    
}

struct WriteReview_Previews: PreviewProvider {
    static var previews: some View {
        WriteReview()
    }
}
