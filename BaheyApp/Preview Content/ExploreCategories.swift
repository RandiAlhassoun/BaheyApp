//
//  ExploreCategories.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI
struct ExploreCategories: View {
    
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
            SearchBar
           
            //List {
//
                    CardView
                //}  .listStyle(.plain)
            
            
      //      }
            Spacer()
           
        }.navigationTitle("Specialist ")
    }
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
                HStack {
                    
                    VStack() {
                        Text("Sarah")
                            .bold()
                            .modifier(ProviderNameTextModifier())
                        Text("Hair style")
                        
                            .modifier(ProviderCatigoryTextModifier())
                        
                        /* star stack */
                        HStack(spacing: 2) {
                            ForEach(1...4, id: \.self) { stars in
                                // Reviewer evaluation stars:
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("yellowFill"))
                                    .font(.system(size: 15))
                            }
                            
                        }
                        .padding()

                        //                            Text("Show more")

                        NavigationLink(destination: ProviderInfo()){
                            Text("Show more")
                                .bold()
                                .modifier(SmallButtonModifier())
                        }
//                        Button {
//                            // ContentView()
//                        } label: {
//                            Text("Show more")
//                                .bold()
//                                .modifier(SmallButtonModifier())
//                        }
                    } // end of VStack
                    
                    Spacer()
                    Image("anood")
                        .resizable()
                        .frame(width: 207, height: 164)
                    
                    
                } // End of HStack image with contents
                
                .frame(width: 359.45, height: 166)
                .background(Color("Lgreen"))
                .cornerRadius(5)
                .listRowSeparator(.hidden)
                //.scrollContentBackground(.hidden)
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

