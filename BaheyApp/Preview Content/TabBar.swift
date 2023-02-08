//
//  TabBar.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 08/02/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView(){
            
            
            Explore().tabItem{Image(systemName: "safari")
                Text("اكتشف")
            }.tag(1)
            
            Favorites().tabItem{Image(systemName: "heart.fill")
                Text("المفضلة")
            }.tag(2)
            
                //EditProfileDeveloperContentView()
                More().tabItem{Image(systemName: "ellipsis")
                    Text("المزيد")
                }
            

//
//                login_().tabItem{Image(systemName: "person.circle")
//                    Text("Profile")
//                }
        }.accentColor((Color("Dpink")))
}
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

