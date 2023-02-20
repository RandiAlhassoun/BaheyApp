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

    
    @State private var isEditing = false
    @State var searchText = ""
  //  private var searchResult: [ServiceInfo] {
//    let results = Service.all()
//
//        //MARK: - Search bar filter and result
//        if searchText.isEmpty {
//            return results
//        }
//        return results.filter {
//            $0.name.lowercased().contains(searchText.lowercased()) ||   $0.category
//                .lowercased().contains(searchText.lowercased())
//        }
//    }
//
    //MARK: - list View and card view
    var body: some View {
        VStack {
            // Headline (subject)
//            Text("Specialist ")
//                .modifier(XLTextModifier())
            //SearchBar
            CardView
           
            //List {
//
                   // CardView
                //}  .listStyle(.plain)
            
            
      //      }
           // Spacer()
           
        }.navigationTitle("Specialist ")
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
        .searchable(text: $searchText, prompt: "Search for a name")

            }
    
    var searchResults: [business] {
        if searchText.isEmpty {
            return dataManager.Test3
        } else {
            return dataManager.Test3.filter { $0.Name.localizedCaseInsensitiveContains(searchText)
                
            }

        }
    }
//            .listStyle(.plain)
     }
        

//MARK: -  Search bar
extension ExploreCategories{
    
    var SearchBar: some View {
        HStack {

           TextField("Search ", text: $searchText)
                .padding(.leading,30)
               .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                       Spacer()
                    Button(action: {
                        searchText = ""
                    }, label: {
                        Image(systemName: "xmark.circle")
                                .foregroundColor(Color.gray)
                                .opacity(searchText.isEmpty ? 0.0 : 1.0)
                    })
                 
                }.padding(.horizontal,10)
                    .foregroundColor(.gray)
                    )
               
//
//                .onTapGesture {
//                    ForEach(searchResult) { ServiceInfo in
//                        Text(ServiceInfo.name)
//                            .searchCompletion(ServiceInfo.name)
//                    }
//                }
            
        }
        .frame(width: 360, height: 44)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray))
        
    }
    
}

