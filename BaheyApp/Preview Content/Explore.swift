//
//  Explore.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI
import Kingfisher

struct Explore: View {
    @EnvironmentObject var dataManager: DataManager
    
    //@State var businessData : business


    @State var searchText = ""

 
    //@State private var searchText = ""

    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                //SearchBar

               // List{
                ScrollView(.vertical){
                    //Text("hi")
                    
                    VStack{
                        if searchText.isEmpty {
                        //MARK: - Photographer
                        NavigationLink(destination: ExploreCategories( cat: "Photographer")){
                           // NavigationLink(destination: ExploreCategories(businessData: businessData.Categorie){

                            
                            ZStack(alignment: .bottom){
                                Image ("Photographer")
                                    .resizable()
                                    .frame(maxWidth: .infinity, maxHeight: 170)
                                    .padding(.horizontal)
                                
                                Text("Photographer")
                                    .multilineTextAlignment(.center)
                                
                                    .foregroundColor(.white)
                                    .modifier(XLTextModifier())
                                    .opacity(0.8)
                                    .padding()
                                
                            }//Z
                        }//Nav
                        
                        
                        //MARK: - Hair
                            NavigationLink(destination: ExploreCategories(cat:"Hair Stylist")){
                            
                            ZStack(alignment: .bottom){
                                Image ("Hair")
                                    .resizable()
                                    .frame(maxWidth: .infinity, maxHeight: 170)
                                    .padding(.horizontal)
                                
                                
                                //NavigationLink(destination: ExploreCategories()){
                                Text("Hair Stylist")                                                                .multilineTextAlignment(.center)
                                
                                    .foregroundColor(.white)
                                    .modifier(XLTextModifier())
                                    .opacity(0.8)
                                    .padding()
                                
                            }//.padding()
                            
                        }//.padding()
                        //MARK: - MakeUp
                            NavigationLink(destination: ExploreCategories(cat: "Makeup Artists")){
                            
                            ZStack(alignment: .bottom){
                                Image ("MakeUp")
                                    .resizable()
                                    .frame(maxWidth: .infinity, maxHeight: 170)
                                    .padding(.horizontal)
                                
                                
                                Text("Makeup Artists")
                                    .multilineTextAlignment(.center)
                                
                                    .foregroundColor(.white)
                                    .modifier(XLTextModifier())
                                    .opacity(0.8)
                                    .padding()
                                //                    NavigationLink(destination: ExploreCategories()){
                            }//Z
                        }//.padding()
                    //}//v
                    
                        
                    } else {
                        // Card View
                        ScrollView{
                            ForEach(/*dataManager.Test3*/searchResults, id: \.id) {  bus in
                                HStack  {
                                    Spacer()
                                    VStack(alignment: .center, spacing: 5) {
                                        //Text("Sarah")
                                        Text (bus.Name)
                                        
                                            .multilineTextAlignment(.center)
                                            .frame(width: 150, height: 50)
                                            .bold()
                                            .modifier(ProviderNameTextModifier())
                                        Text(bus.Categorie)
                                        
                                            .modifier(ProviderCatigoryTextModifier())
                                        
                                        /* star stack */
                                        HStack(spacing: 2) {
                                            ForEach(1...bus.star, id: \.self) { stars in
                                                // Reviewer evaluation stars:
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(Color("yellowFill"))
                                                    .font(.system(size: 15))
                                            }
                                            
                                        }
                                        //.padding()
                                        
                                        //                            Text("Show more")
                                        .padding(.vertical)
                                        
                                        
                                        NavigationLink(destination: ProviderInfo(businessData: bus)) {
                                            Text("Show more")
                                                .bold()
                                                .modifier(SmallButtonModifier())
                                        }
                                    } // end of VStack
                                    
                                    Spacer()
                                    //Image("anood")
                                    KFImage(URL(string: bus.ima)!)
                                        .resizable()
                                        .frame(width: 207, height: 164)
                                    
                                    
                                } // End of HStack image with contents
                                
                                .frame(width: 359.45, height: 166)
                                .background(Color("Lgreen"))
                                .cornerRadius(5)
                                .listRowSeparator(.hidden)
                                //.scrollContentBackground(.hidden)
                            }//for
                        }//S
                    }

                        
                    //MARK: - MakeUp
                    
                    }//v
                .navigationTitle("Categories")
                .frame(maxWidth: .infinity)
                    
            }//Scro;;
                //.padding(.horizontal)
                
            }//Vstack
        }//NavigationView
        .searchable(text: $searchText, prompt: "Search for a name")

        //.searchable(text: $searchText)


    }
    var searchResults: [business] {
        if searchText.isEmpty {
            return dataManager.Test3
        } else {
            return dataManager.Test3.filter { $0.Name.localizedCaseInsensitiveContains(searchText)
                
            }

        }
    }
}



struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}


//
////MARK: -  Search bar
//extension Explore{
//
//    var SearchBar: some View {
//        HStack {
//
//           TextField("Search ", text: $searchText)
//                .padding(.leading,30)
//               .overlay(
//                HStack {
//                    Image(systemName: "magnifyingglass")
//                       Spacer()
//                    Button(action: {
//                        searchText = ""
//                    }, label: {
//                        Image(systemName: "xmark.circle")
//                                .foregroundColor(Color.gray)
//                                .opacity(searchText.isEmpty ? 0.0 : 1.0)
//                    })
//
//                }.padding(.horizontal,10)
//                    .foregroundColor(.gray)
//                    )
//
////
////                .onTapGesture {
////                    ForEach(searchResult) { ServiceInfo in
////                        Text(ServiceInfo.name)
////                            .searchCompletion(ServiceInfo.name)
////                    }
////                }
//
//        }
//        .frame(width: 360, height: 44)
//        .background(
//            RoundedRectangle(cornerRadius: 5)
//                .stroke(.gray))
//
//    }
//
//}


