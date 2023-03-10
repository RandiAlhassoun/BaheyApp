//
//  ProviderInfo.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI
import Kingfisher


struct ProviderInfo: View {
    @EnvironmentObject var dataManager: DataManager

    @State var toViewAllReviews = false //To go to ViewAllReviews after clicking "More" .
    
    @State var businessData : business
    
    
    var body: some View {
        //NavigationView(){
        
        VStack{
            
            
            
            
            //Image("saraMakeUp")
            KFImage(URL(string: businessData.ima)!)
                .resizable()
                .frame(height: 250)
                .ignoresSafeArea()
            
            //Main VStack that contains all the views.
            ScrollView(.vertical){
                //                VStack{
                //                    Image("saraMakeUp")
                //                        .resizable()
                //                        .frame(height: 250)
                //                        .ignoresSafeArea()
                //
                //MARK: - provider name & favorite heart:
                
                //HStack contains provider name & favorite heart.
                HStack{
                    Text(businessData.Name)
                        .modifier(XLTextModifier())
                        .padding(.horizontal)
                    Spacer()
                    //calling favoriteView() which contains the code for add to favorite.
                    favoriteView().padding(.horizontal)
                }//End of HStack
                
                //MARK: - provider city & ctegory:
                
                //VStack Contains the details of each provider "city & ctegory".
                VStack(alignment: .leading){
                    Text("Details").modifier(ProviderInfoHeadersTextModifier())
                    //.padding(.bottom)
                    
                    HStack(){
                        Group{
                            Text("City:")
                            Text(businessData.City)}.modifier(RegularTextModifier())
                        
                    }//HStack For City
                    
                    
                    HStack(){
                        Group{
                            Text("Category:")
                            Text(businessData.Categorie)}
                        .modifier(RegularTextModifier())
                    }//HStack For Category
                    
                    
                }//End of VStack details
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding([.leading, .bottom, .trailing])
                
                Divider()
                //MARK: - About Us:
                VStack(alignment: .leading){//Contains About  us for each provider
                    Text("About Us").modifier(ProviderInfoHeadersTextModifier())
                    Text(businessData.About)
                        .modifier(RegularTextModifier())
                }//End of VStack about us.
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding([.leading, .bottom, .trailing])
                Divider()
                //MARK: - Social networking sites:
                
                //VStack Contains Social networking sites for each provider
                VStack(alignment: .leading){
                    Text("Social networking sites").modifier(ProviderInfoHeadersTextModifier())
                    Button(action: {
                        //NOTE: Add your link here in: let yourURL = URL(string:"HERE")
                        //if let yourURL = URL(string: "https://www.instagram.com/bahey_app/?igshid=YmMyMTA2M2Y%3D") {
                        if let yourURL = URL(string: businessData.Social) {
                            UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                        }
                        
                    }, label: {
                        Image( "instagram") // <- Change icon to your preferred one
                            .resizable()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.blue)
                    })
                    
                }//End of VStack Social networking sites
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding([.leading, .bottom, .trailing])
                
                //MARK: - Reviews:
                
                //Contains reviews for each provider & more
                VStack(alignment: .leading){
                    HStack{
                        Text("Reviews").modifier(ProviderInfoHeadersTextModifier())
                        Spacer()
                        //businessData: bus
                        NavigationLink(destination: ViewAllReviews(Bid: businessData.id)) {
                            Text("More").modifier(AccentTextModifier())
                        }
                        
                    }//End of VStack Reviews & more
                    .padding(.horizontal)
                    //ScrollView to hold the reviews
                    ScrollView(.horizontal){
                        HStack(){
                            
                            
                            
                            
                            ForEach(dataManager.Reviews.filter { $0.BID.localizedCaseInsensitiveContains(businessData.id)}, id: \.id) { bus in
                                VStack(alignment: .leading){
                                    // Reviewer name:
                                    Text(bus.ReviewerName)
                                        .modifier(RegularTextModifier())
                                        .bold()
                                        .padding([.top, .leading, .trailing])
                                    // Reviewer evaluation stars:
                                   // ForEach(1...bus.stars, id: \.id){ str in
                                    HStack{
                                        Text(" ")
                                    ForEach(1...bus.stars, id: \.self) { stars in
            //                            HStack{
                                       
                                            Image(systemName: "star.fill")
                                                .foregroundColor(Color("yellowFill"))
                                               // .padding(.horizontal)
                                               // .font(.system(size: 15))
                                        }//h
                                    }//for
                                    // Reviewer review:
                                    Text(bus.Reviewe)
                                    
                                        .modifier(RegularTextModifier())
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                    .frame(width: 200, height:130 , alignment: .leading)
                                //navigationBackButton Modifier that creates a back button with custom ccolor.
                                    .navigationBackButton(color: UIColor(red: 0.73, green: 0.41, blue: 0.43, alpha: 1.00),  text: "Back") //To use a custom color you have to get the UIColor from the hex using this website:https://www.uicolor.io
                                
                                //Modifiers to make the VStack as a block
                                    .modifier(reviewBackgrounddModifier())
                                
                            }//for

                            //Calling ReviewBlockView for each review block.
//                            ForEach(1...3, id: \.self) { i in
//                                SmallReviewBlockView()
//                            }
  
                            
                            //ForEach(1...businessData.Reviews, id: \.self) { stars in

                        
//                            ForEach(businessData.Reviews, id: \.self) { stars in
//                            ForEach(businessData.RName, id: \.self) { stars in
//
//                                VStack(alignment: .leading){
//                                    Text(stars)
//                                        .modifier(RegularTextModifier())
//                                        .bold()
//                                        .padding([.top, .leading, .trailing])
//                                    //z=z+1
////                            }
//                         //   var z = 0
//                            ForEach(0...businessData.Reviews.count-1, id: \.self) { stars in
//
//                                VStack(alignment: .leading){
//                                    
//                                    
//                                    //print(id)
//                                    Text(businessData.RName[stars])
//                                        .modifier(RegularTextModifier())
//                                        .bold()
//                                        .padding([.top, .leading, .trailing])
//                                    //z=z+1
//
//                                    Image(systemName: "star.fill")
//                                        .foregroundColor(Color("yellowFill"))
//                                        .font(.system(size: 15))
//                                        .padding(.horizontal)
//                                    Text(businessData.Reviews[stars])
//                                        .modifier(RegularTextModifier())
//                                        .padding(.horizontal)
//                                    Spacer()
//
//                                }//Modifiers to make the VStack as a block
//                                .frame(width: 200, height:130 , alignment: .leading)
//                                .background(Color("Lgreen"))
//                                .cornerRadius(10)
//
//
//                                //z+=+1
//                            }//for
                            
                        }//End of HStack review block
                        
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding(.horizontal)
                    }
                }//End of MAIN VStack
                
                //   .fullScreenCover(isPresented: $toViewAllReviews) {
                //  ViewAllReviews()}
                
            }//scroll
        }//vSta
        .ignoresSafeArea()
        //}//End of body
        
        
        // .navigationBarTitleDisplayMode(.large)
    }//End of struct ProviderInfo
}

//struct ProviderInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        ProviderInfo(Card_id: "2")
//    }
//}

//MARK: - favoriteView:
//struct struct Contains the code for add to favorite.
struct favoriteView: View {
    @State var isFavoritePressed = false
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill").resizable()
                .frame(width: 25, height: 25)
                .opacity(isFavoritePressed ? 1 : 0)
                .scaleEffect(isFavoritePressed ? 1.0 : 0.1)
                .animation(.linear)
            Image(systemName: "heart").resizable()
                .frame(width: 25, height: 25)
        }
        .onTapGesture {
            self.isFavoritePressed.toggle()
        }
        .foregroundColor(isFavoritePressed ? Color("Dpink") : Color("Dpink"))
    }
}

//MARK: - SmallReviewBlockView:
struct SmallReviewBlockView: View {

    var body: some View {
        VStack(alignment: .leading){
            Text("Shahd")
                .modifier(RegularTextModifier())
                .bold()
                .padding([.top, .leading, .trailing])

            Image(systemName: "star.fill")
                .foregroundColor(Color("yellowFill"))
                .font(.system(size: 15))
                .padding(.horizontal)
            Text("shhkkwkewkejelqlqwlqjeqlwjlqljwjlqjwlqjdsdkajd")
                .modifier(RegularTextModifier())
                .padding(.horizontal)
            Spacer()

        }//Modifiers to make the VStack as a block
        .frame(width: 200, height:130 , alignment: .leading)
        .background(Color("Lgreen"))
        .cornerRadius(10)
    }}
