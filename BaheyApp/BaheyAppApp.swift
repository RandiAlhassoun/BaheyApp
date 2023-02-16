//
//  BaheyAppApp.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI
import Firebase

@main
struct BaheyAppApp: App {
//    init(){
//        setupFirebase()
//    }
    var body: some Scene {
        WindowGroup {
            //Splash()
            //More()

            //FavoritesNotRegistered()
            //ProviderInfo()
           // WriteReview()
            SignUp()
        }
    }
}
//private extension BaheyAppApp {
//    func setupFirebase() {
//        FirebaseConfiguration.shared.setLoggerLevel(.min)
//        FirebaseApp.configure()
//    }
//}
