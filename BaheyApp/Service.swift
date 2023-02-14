//
//  Service.swift
//  BaheyApp
//
//  Created by Nourah Almusaad on 14/02/2023.
//

import Foundation
import SwiftUI

public struct Service {
    
    static func all() -> [ServiceInfo] {
     return [
        ServiceInfo(image: "Hadeel", name: "Hadeel", category: "Hair style", star: "⭐️⭐️⭐️"),
        ServiceInfo(image: "ahood", name: "Ahood hair", category: "Hair style", star: "⭐️⭐️⭐️⭐️"),
        ServiceInfo(image: "Layla", name: "Layla Alanzi", category: "Hair style", star: "⭐️⭐️"),
        ServiceInfo(image: "anood", name: "Anood hair", category: "Hair style", star: "⭐️⭐️⭐️"),
//        ServiceInfo(image: "Photo-sara", name: "Sarah photography", category: "Phtography", star: "⭐️⭐️⭐️⭐️"),
//        ServiceInfo(image: "Sarah", name: "Sarah Maakeup", category: "Makeup Artest", star: "⭐️⭐️⭐️")
        ]
    }
}

struct ServiceInfo: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var category: String
    var star: String
    }
    
