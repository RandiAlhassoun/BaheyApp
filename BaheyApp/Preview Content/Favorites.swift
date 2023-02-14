//
//  Favorites.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//


import SwiftUI

struct Favorites: View {
    var body: some View {
        VStack {
            // Healine (subject)
            Text("Saved ")
                .modifier(XLTextModifier())
            
            //Card View
            List {
//                CardView(service: service2)
//                    .listRowSeparator(.hidden)
//                CardView(service: service6)
//                    .listRowSeparator(.hidden)
//               CardView(service: service5)
//                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
         //   .searchable(text: $searchText)
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
