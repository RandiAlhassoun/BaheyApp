//
//  Service Provider.swift
//  BaheyApp
//
//  Created by Nourah Almusaad on 08/02/2023.
//

import Foundation

struct ServiceProvider {
    let id = UUID()
    let name: String
    let category: String
    let image: String
    let star: String
}

   
let service1 = ServiceProvider(name: "المصصفة هديل", category: "مصففة شعر", image: "Hadeel", star: "★★★")
let service2 = ServiceProvider(name: " عهود شعر", category: "مصففة شعر", image:"ahood", star: "★★★★★")
let service3 = ServiceProvider(name: "Layla Hair", category: "مصففة شعر", image: "Layla",star: "★★")
let service4 = ServiceProvider(name: "العنود كوفيرة", category: "مصففة شعر", image: "anood",star: "★★★")
    

//class MyNotesViewModel: ObservableObject {
//    @Published var folders = MyNotes.testFolder
//}
//
//struct MyNotes: Identifiable {
//    var id = UUID()
//   var color: Color
//    var name: String
//}
//
//extension MyNotes {
//    static let testFolder = [
//        MyNotes( color: Color("Pink"), name: NSLocalizedString("Work", comment: "")),
//        MyNotes( color: Color("Yellow"), name: NSLocalizedString("House furniture", comment: "")),
//        MyNotes(color: Color("Green"), name:  NSLocalizedString("Spending", comment: ""))
//    ]
//
//}
