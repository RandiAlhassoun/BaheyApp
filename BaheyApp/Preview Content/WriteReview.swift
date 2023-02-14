//
//  WriteReview.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct WriteReview: View {
    //@State var feildValue = ""
    @State var toAfterReview = false //To go to ViewAllReviews after clicking Done button.
    @State var isFavoritePressed = false
    //let maxCharacters = 50
    
    var body: some View {
        VStack(){
            //            Spacer()
            //            Text("Add a review")
            VStack(alignment: .leading){
                Spacer()
                Text("Click to rate").modifier(WriteReviewHeadersModifier())
                    .padding(.bottom)
                
                //Calling stars view, by default it is 5 stars.
                StarsSelectionView(rating:5).padding(.bottom)
                
                Text("Write Your Review").modifier(WriteReviewHeadersModifier())
                    .padding(.bottom)
                
                
                ReviewTextFieldView()
                Spacer()
                Button {
                    
                    toAfterReview.toggle()
                    
                } label: {
                    Text("Submit")
                        .modifier(LargeButtonModifier())
                    
                }
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

//MARK: - StarsSelectionView:
struct StarsSelectionView: View {
    @State var rating: Int // change this to @Binding after layout is tested
    let highestRating = 5
    let unselected = Image (systemName: "star")
    let selected = Image (systemName: "star.fill")
    //let font: Font = .largeTitle
    let fillColor: Color = Color("yellowFill")
    let emptyColor: Color = .gray
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...highestRating, id: \.self) { number in
                showStar (for: number)
                    .foregroundColor (number <= rating ? fillColor : emptyColor)
                    .onTapGesture {
                        rating = number
                        
                    }
                    .font(.system(size: 25))
                // .font (font)
                
            }
        }
        
    }
    func showStar ( for number: Int) -> Image {
        if number > rating {
            return unselected
        } else {
            return selected
            
        }
    }
}
//    struct StarsSelectionView_Previews: PreviewProvider {
//        static var previews: some View {
//            StarsSelectionView(rating: 4)
//        }}}
//MARK: - ReviewTextFieldView:

struct ReviewTextFieldView: View {
    @State var feildValue = ""
    let maxCharacters = 100
    //@State var isDisableFeild = true
    var body: some View {
        VStack{
            TextField("",
                      text: $feildValue ,  axis: .vertical)//axis parameter supports more advanced behaviors, like reserving a minimum amount of space and expanding as more content is added, and then scrolling once the content exceeds the upper limit
            .modifier(reviewTextFieldModifier())
            
            //** NOTE: onReceive code to let the user enter chacters to maxCharacters and then allow the user to delete **//
            .onReceive(feildValue .publisher.collect().map {$0.count > 100}) { enabled in
                self.feildValue  = String(self.feildValue .prefix(100))
            }
            
        }
        //This is to show the remaining characters:
        VStack(alignment: .leading){
            Text("\(maxCharacters - feildValue.count) characters remaining")
            .foregroundColor(.gray)}
        
    }}

