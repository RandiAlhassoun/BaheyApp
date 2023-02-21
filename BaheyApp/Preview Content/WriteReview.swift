//
//  WriteReview.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI
import Firebase

struct WriteReview: View {
    
    //@EnvironmentObject var dataManager: DataManager

    let CurrentUserName = Auth.auth().currentUser?.displayName

    @State var Bid = ""

    //@State var fkeildValue = ""
    @State var toAfterReview = false //To go to ViewAllReviews after clicking Done button.
    @State var isFavoritePressed = false
    @State var isF = false

    
    @State var feildValue = ""
    let maxCharacters = 100
    //let maxCharacters = 50
    @Environment(\.dismiss) var dismiss
    

    var body: some View {
        VStack(){
            //            Spacer()
            //            Text("Add a review")
            VStack(alignment: .leading){
                Spacer()
                Text("Click to rate").modifier(WriteReviewHeadersModifier())
                    .padding(.bottom)
                
                //Calling stars view, by default it is 5 stars.
                StarsSelectionView(rating:3).padding(.bottom)
                
                Text("Write Your Review").modifier(WriteReviewHeadersModifier())
                    .padding(.bottom)
                
                
                //ReviewTextFieldView()
                //MARK: -
                
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
                
                
                //MARK: -
                Spacer()
                Button {
                    //toAfterReview.toggle()
                   //
                    //self.AddInfo(stars: 4, ReviewerName: "2", BID: "1", Reviewe:feildValue)
                    self.AddInfo(BID: Bid, stars: 3, ReviewerName: (CurrentUserName ?? "Userx"), Reviewe: feildValue)
                                //(BID: String, stars: Int, ReviewerName: String, Reviewe: String)

                    dismiss()
                    
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
    

    func AddInfo(BID: String, stars: Int, ReviewerName: String, Reviewe: String){
        let db = Firestore.firestore()
        db.collection("Reviews").document().setData(["BID": BID, "stars": stars, "ReviewerName": ReviewerName, "Reviewe": Reviewe])

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
            HStack(spacing: 3) {
                Text("\(maxCharacters - feildValue.count)")
                Text("characters remaining")

            }
            .foregroundColor(.gray)
//            Text("\(maxCharacters - feildValue.count)" + "characters remaining")
//            Text("\(maxCharacters - feildValue.count)" + NSLocalizedString("characters remaining", comment: ""))
//            Text("\(maxCharacters - feildValue.count)" + NSLocalizedString("characters remaining", comment: ""))
//            Text("\(5)")
//            Text(String(5))
            }
        
    }}


