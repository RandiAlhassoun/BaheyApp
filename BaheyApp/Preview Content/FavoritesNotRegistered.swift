//
//  FavoritesNotRegistered.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//


import SwiftUI

struct FavoritesNotRegistered: View {
    var body: some View {
        VStack{
            Text("Favorites")
                .modifier(XLTextModifier())
              Spacer()
            
            Image("FavoritesNotRegester")
                .resizable()
                .frame(width: 266.09, height: 250)
             //   .padding()
            
            Text("Sorry!")
              //  .padding()
                .modifier(EmptyStateTextModifier())
            
            Text("It seems that you aren’t logged in to your account , please login to view your list ")
                .modifier(EmptyStateTextModifier())
                .padding()
            
            
//            NavigationLink(destination: Login() ){
//                Text("Login").modifier(MediemButtonModifier())
//
//            }
          
           /* Login Button and navigation to Login page*/
            NavigationLink {
                // destination view to navigation to
                Login()
            } label: {
                Text("Login")
            }
          .modifier(MediemButtonModifier())
          .padding(20)
          Spacer()

       }
    }
}

struct FavoritesNotRegistered_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesNotRegistered()
    }
}
