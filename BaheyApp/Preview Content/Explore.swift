//
//  Explore.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct Explore: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView{
            VStack{
                List{
                //Text("hi")

                //MARK: - Photographer
                ZStack(alignment: .bottomLeading){
                    Image ("Photographer")
                        .resizable()
                        .frame(width: 350, height: 168)
                    
                    Text("Photographer")
                    //.multilineTextAlignment(.center)
                    
                        .foregroundColor(.white)
                        .modifier(XLTextModifier())
                }//.padding()
                //MARK: - Hair
                
                ZStack(alignment: .bottomLeading){
                    Image ("Hair")
                        .resizable()
                        .frame(width: 350, height: 168)
                    
                    Text("Hair Stylist")
                    //.multilineTextAlignment(.center)
                    
                        .foregroundColor(.white)
                        .modifier(XLTextModifier())
                }//.padding()
                //MARK: - MakeUp
                ZStack(alignment: .bottomLeading){
                    Image ("MakeUp")
                        .resizable()
                        .frame(width: 350, height: 168)
                    
                    Text("Makeup Artists")
                    //.multilineTextAlignment(.center)
                    
                        .foregroundColor(.white)
                        .modifier(XLTextModifier())
                }//.padding()
                //MARK: - MakeUp
                
                
                .navigationTitle("category")
            }//list
            }//Vstack
        }//NavigationView
        .searchable(text: $searchText)

    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
