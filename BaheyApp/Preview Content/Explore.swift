//
//  Explore.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct Explore: View {
    @State var searchText = ""

 
    //@State private var searchText = ""

    var body: some View {
        NavigationView{
            VStack{
                SearchBar

                List{
                //Text("hi")

                //MARK: - Photographer
                    ZStack(alignment: .bottom){
                    Image ("Photographer")
                        .resizable()
                        .frame(width: 350, height: 168)
                      

                            NavigationLink(destination: ExploreCategories()){
                                Text("Photographer")
                                    .multilineTextAlignment(.center)
                                
                                    .foregroundColor(.white)
                                    .modifier(XLTextModifier())
                                    .opacity(0.8)
                                
                            }
                            
                        

                }//.padding()
                    
                //MARK: - Hair
                
                ZStack(alignment: .bottomLeading){
                    Image ("Hair")
                        .resizable()
                        .frame(width: 350, height: 168)
                    
                    
                    NavigationLink(destination: ExploreCategories()){
                        Text("Hair Stylist")                            .multilineTextAlignment(.center)
                        
                            .foregroundColor(.white)
                            .modifier(XLTextModifier())
                            .opacity(0.8)
                        
                    }
                    
//                    Text("Hair Stylist")
                    //.multilineTextAlignment(.center)
                    
                        .foregroundColor(.white)
                        .modifier(XLTextModifier())
                }//.padding()
                //MARK: - MakeUp
                ZStack(alignment: .bottomLeading){
                    Image ("MakeUp")
                        .resizable()
                        .frame(width: 350, height: 168)
                    
                    
                    NavigationLink(destination: ExploreCategories()){
                        Text("Makeup Artists")

                            .foregroundColor(.white)
                            .modifier(XLTextModifier())
                            .opacity(0.8)
                        
                    }

                    
                    //Text("Makeup Artists")
                    //.multilineTextAlignment(.center)
                    
                        .foregroundColor(.white)
                        .modifier(XLTextModifier())
                }//.padding()
                //MARK: - MakeUp
                
                
                .navigationTitle("category")
//                    NavigationLink(destination: ExploreCategories()){
//                        Text("Photographer")
//                    }
                    
            }//list
            }//Vstack
        }//NavigationView
        //.searchable(text: $searchText)


    }
}



struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}



//MARK: -  Search bar
extension Explore{
    
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


