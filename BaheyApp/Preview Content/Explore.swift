//
//  Explore.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct Explore: View {
    @State private var searchText = ""
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    
    var body: some View {
        VStack {
            
        Text("المتخصصات")
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }
            }
  
        }
        .searchable(text: $searchText)
    }
}
    var searchResults: [String] {
          if searchText.isEmpty {
              return names
          } else {
              return names.filter { $0.contains(searchText) }
          }
      }
    }


struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}

//Build service provider frame
struct ServiceCerd: View {
//    var folder: MyNotes
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .shadow(radius: 4)
            
                .frame(width: 317, height: 74)
                .overlay(
                 //   Text(folder.name)
                    Text("")
                        .font(.title3)
                        .bold()
                )
            Rectangle()
         
                .frame(width: 20, height: 74)
                .padding(.trailing,299)
              //  .foregroundColor(folder.color)
                .foregroundColor(Color.blue)
        }
    
    }
}
