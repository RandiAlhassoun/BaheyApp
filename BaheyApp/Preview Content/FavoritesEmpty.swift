//
//  FavoritesEmpty.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct FavoritesEmpty: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Favorites")
                .modifier(XLTextModifier())
               Spacer()
            
            Image("FavoritesEmpty")
                .resizable()
                .frame(width: 266.09, height: 250)
               .padding(.bottom, 20)
            
            Text("There are no favourites!! ")
                .modifier(EmptyStateTextModifier())
            
            Text("Click on the heart shape to add to your favourites! ")
//                .modifier(EmptyStateTextModifier())
                .modifier(RegularTextModifier())

                .multilineTextAlignment(.center)
            Spacer()
            
        }
    }
}

struct FavoritesEmpty_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesEmpty()
    }
}
