//
////  DataManager22.swift
////  BaheyApp
////
////  Created by Rand Alhassoun on 14/02/2023.
////
//
//import SwiftUI
//import Firebase
////import Kingfisher
//
//
//// dogs = reviews2_Testing
//// Dog = reviews2reviews2
//
//class DataManager2: ObservableObject {
//    
//   // @Published var reviews2_Testing: [reviews2] = []
//    
//    @Published var Reviews: [reviews2] = []
//    //@Published var Reviews: [reviews2] = []
//
//
//    
//    init(){
//        fetchreviews2_Testing()
//        
//        //fetchRestaurant()
//    }
//    
//    
//    
//    
//    func fetchreviews2_Testing () {
//        Reviews.removeAll ()
//        let db = Firestore.firestore()
//        
//        let ref = db.collection("Reviews")
//        
//        
//        
//        ref.getDocuments { snapshot, error in
//            guard error == nil else {
//                print (error!.localizedDescription)
//                return
//            }
//            
//            
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data ()
//                    //   print(data)
//                    
//                    
//                
//                                        let Reviewe = data["Reviewe"] as? String ?? "no Reviewe"
//                                        let ReviewerName = data["ReviewerName"] as? String ?? "no Name"
//                                        let BID = data[ "BID"] as? String ?? "no BID"
//                                        let stars  = data[ "stars"] as? Int ?? 3
//                    
//                    
//                    
//
//                    let reviews2 = reviews2(Reviewe: Reviewe, ReviewerName: ReviewerName, BID: BID, stars: stars)
//                    
//                    
//                    
//                    
//                    
//                    
//                    //                    print("-----------")
//                    //                    print(reviews2.Name)
//                    //                    print(reviews2.City)
//                    //                    print(reviews2.Categorie)
//                    
//                    self.Reviews.append(reviews2)
//                    
//                    
//                }
//                
//                print(self.Reviews.count)
//                print(self.Reviews)
//
//                print("vvvvvvvvvvvvvvvvvvv")
//
//            }
//            
//        }
//        
//    }
//    
//    
//    
//    
//}
