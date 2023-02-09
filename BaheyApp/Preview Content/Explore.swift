//
//  Explore.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct Explore: View {
  //  @State private var searchText = ""
//    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    let service: ServiceProvider
    
    var body: some View {
        VStack {
            
        Text("المتخصصات")
            ServiceCerd(service: service)
//        NavigationStack {
//
//
//        }
//        .searchable(text: $searchText)
    }
}
//    var searchResults: [String] {
//          if searchText.isEmpty {
//              return names
//          } else {
//              return names.filter { $0.contains(searchText) }
//          }
//      }
    }


struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore(service: service1)
    }
}

//Build service provider frame
struct ServiceCerd: View {
    let service: ServiceProvider
    
    var body: some View {
        ZStack{
          
            HStack {
                VStack {
                    Text(service.name)
                        .modifier(ProviderNameTextModifier())
                    Text(service.category)
                        .modifier(ProviderCatigoryTextModifier())
                 
                    Text(service.star)
                    Spacer()
                    Button {
                   // print("Button was tapped")
                   } label: {
                    Text("Show more ")
                        .modifier(SmallButtonModifier())
                   }
                }
                Image(service.image)
                    .resizable()
                    .frame(width:207, height: 164 )
                    .clipped()
            }
       
        }
        .frame(width:360, height: 166)
        .background(Color("Lgreen"))
    
    }
}
