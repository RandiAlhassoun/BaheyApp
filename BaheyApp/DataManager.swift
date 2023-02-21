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
    
    @Published var business_info: [business] = []
    @Published var Reviews: [reviews2] = []


    
    init(){
        fetchbusiness_Testing()
        fetchbusiness_Testing2()
        //fetchRestaurant()
    }
    
    
    
    
    func fetchbusiness_Testing () {
        business_info.removeAll ()
        let db = Firestore.firestore()
        
        let ref = db.collection("business_info")
        
        
        
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
                    let star  = data[ "star"] as? Int ?? 1
                    let About  = data[ "About"] as? String ?? "About non"
                    let Social  = data[ "Social"] as? String ?? "Social non"
                    

                    let Business = business(id: id, Name: Name, City: City, Categorie: Categorie ,ima: ima ,star: star ,About: About ,Social: Social)
                    
                    
                    
                    
                    
                    
                    //                    print("-----------")
                    //                    print(Business.Name)
                    //                    print(Business.City)
                    //                    print(Business.Categorie)
                    
                    self.business_info.append(Business)
                    
                    
                }
                
                print(self.business_info.count)
                print(self.business_info)

                print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrr ")

            }
            
        }
        
    }
    
    
    
    
    
// //MARK: -
//
//
//
    func fetchbusiness_Testing2 () {
        Reviews.removeAll ()
        let db = Firestore.firestore()

        let ref = db.collection("Reviews")



        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print (error!.localizedDescription)
                return
            }


            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data ()
                    //   print(data)



                    let Reviewe = data["Reviewe"] as? String ?? "no Reviewe"
                    let ReviewerName = data["ReviewerName"] as? String ?? "no Name"
                    let BID = data[ "BID"] as? String ?? "no BID"
                    let stars  = data[ "stars"] as? Int ?? 3





                    let reviews2 = reviews2(Reviewe: Reviewe, ReviewerName: ReviewerName, BID: BID, stars: stars)








                    //                    print("-----------")
                    //                    print(Business.Name)
                    //                    print(Business.City)
                    //                    print(Business.Categorie)

                    self.Reviews.append(reviews2)


                }

                print(self.Reviews.count)
                print(self.Reviews)

                print("vvvvvvvvvvvvv")

            }

        }

    }
//
    
    
    
    
    
    
    
    
    
    
    
    // FirestoreManager.swift
    
//    func fetchRestaurant() {
//        let db = Firestore.firestore()
//
//        let docRef = db.collection("business_info")
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
//                        self.business_info.append(Business)
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
