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


    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Splash()

            
//            TestView()
//                .environmentObject (dataManager)



        }
    }
}
//private extension BaheyAppApp {
//    func setupFirebase() {
//        FirebaseConfiguration.shared.setLoggerLevel(.min)
//        FirebaseApp.configure()
//    }
//}
