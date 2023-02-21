//
//  ExploreCategories.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI
import Kingfisher

struct ExploreCategories: View {
    
    @EnvironmentObject var dataManager: DataManager
    @State var X = 0
    @State var cat = ""
    

    
    @State private var isEditing = false
    @State var searchText = ""

    //MARK: - list View and card view
    var body: some View {
        VStack {

            //SearchBar
            CardView

           
        }.navigationTitle(cat)
    }
    
    //MARK: - SEARCH
    
}

struct ExploreCategories_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCategories()
    }
}


//MARK: - extention for design liist view
extension ExploreCategories {
    var CardView: some View {
        // Card View
        ScrollView{
           // if X == 0{
            ForEach(/*dataManager.Test3*/searchResults.filter { $0.Categorie.localizedCaseInsensitiveContains(cat)}, id: \.id) {  bus in
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
            //}//if
        }//S
        .searchable(text: $searchText, prompt: "Search for a name")

            }
    
    var searchResults: [business] {
        if searchText.isEmpty {
            return dataManager.business_info
        } else {
            return dataManager.business_info.filter { $0.Name.localizedCaseInsensitiveContains(searchText)
                
            }

        }
    }
//            .listStyle(.plain)
     }
        

//MARK: -  Search bar
//extension ExploreCategories{
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
