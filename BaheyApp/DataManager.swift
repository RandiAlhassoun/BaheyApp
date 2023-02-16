//
//  DataManager.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 14/02/2023.
//

import SwiftUI
import Firebase
//import Kingfisher


// dogs = business_Testing
// Dog = businessbusiness

class DataManager: ObservableObject {
    
   // @Published var business_Testing: [business] = []
    
    @Published var Test3: [business] = []

    
    init(){
        fetchbusiness_Testing()
        
        //fetchRestaurant()
    }
    
    
    
    
    func fetchbusiness_Testing () {
        Test3.removeAll ()
        let db = Firestore.firestore()
        
        let ref = db.collection("Test3")
        
        
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print (error!.localizedDescription)
                return
            }
            
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data ()
                    //   print(data)
                    
                    
                    
                    let id = data["id"] as? String ?? "no id"
                    let Name = data["Name"] as? String ?? "no Name"
                    let City = data[ "City"] as? String ?? "no City"
                    let Categorie  = data[ "Categorie"] as? String ?? "no Categorie"
                    let ima  = data[ "ima"] as? String ?? "Hair"
                    
                    let Business = business(id: id, Name: Name, City: City, Categorie: Categorie ,ima: ima)
                    
                    
                    
                    
                    
                    
                    //                    print("-----------")
                    //                    print(Business.Name)
                    //                    print(Business.City)
                    //                    print(Business.Categorie)
                    
                    self.Test3.append(Business)
                    
                    
                }
                
                print(self.Test3)

            }
            
        }
        
    }
    
    
    
    
    
 //MARK: -
    // FirestoreManager.swift
    
//    func fetchRestaurant() {
//        let db = Firestore.firestore()
//
//        let docRef = db.collection("Test3")
//
//        docRef.getDocuments { (document, error) in
//            guard error == nil else {
//                print("error", error ?? "")
//                return
//            }
//
//            if let document = document {
//                for document in document.documents {
//                    let data = document.data()
//
//
//                        let id = data["id"] as? String ?? "no id"
//                        let Name = data["Name"] as? String ?? "no Name"
//                        let City = data[ "City"] as? String ?? "no City"
//                        let Categorie  = data[ "Categorie "] as? String ?? "no Categorie"
//
//                        let Business = business(id: id, Name: Name, City: City, Categorie: Categorie)
//
//
//
//
//
//
//                        //                    print("-----------")
//                        //                    print(Business.Name)
//                        //                    print(Business.City)
//                        //                    print(Business.Categorie)
//
//                        self.Test3.append(Business)
//
//                        print("data", data)
//
//                    }
//                }
//
//            }
//
//
//
//    }
    
    
    
}
/**
 (id: id, Name: Name, City: City, Categorie: Categorie)
 
 
 
 { snapshot, error in
     guard error == nil else {
         print (error!.localizedDescription)
         return
     }
     
     
     if let snapshot = snapshot {
         for document in snapshot.documents {
             let data = document.data ()
             let Name = data["Name"] as? String ?? ""
             let City = data[ "City"] as? String ?? ""
             let Categorie  = data[ "Categorie "] as? String ?? ""
             
             let business = business_Testing(Name: Name, City: City, Categorie: Categorie)
             // let dog = business_Testing(Name: Name, City: City, Categorie: Categorie)
             //self.dogs.append (dog)
             
         }
     }
 }
 */
