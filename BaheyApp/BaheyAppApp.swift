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

            Splash().environmentObject(dataManager)

        }
    }
}

