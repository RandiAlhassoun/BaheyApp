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
            VStack(spacing: 20){
                SearchBar

               // List{
                ScrollView(.vertical){
                    //Text("hi")
                    
                    //MARK: - Photographer
                    NavigationLink(destination: ExploreCategories()){
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
                    NavigationLink(destination: ExploreCategories()){
                        
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
                    NavigationLink(destination: ExploreCategories()){
                        
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
                        //.padding()
                        
                    }//.padding()
                    
                    //MARK: - MakeUp
                    
               
                .navigationTitle("Categories")
                .frame(maxWidth: .infinity)
                    
            }//Scro;;
                //.padding(.horizontal)
                
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


