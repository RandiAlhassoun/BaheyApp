////
////  TestView.swift
////  BaheyApp
////
////  Created by Rand Alhassoun on 14/02/2023.
////
//
//import SwiftUI
//import Kingfisher
//
//// dogs = business_Testing
//// Dog = businessbusiness
////id: id, Name: Name, City: City, Categorie: Categorie)
//
//struct TestView: View {
//    
//    @EnvironmentObject var dataManager: DataManager
//    
//    
//    //@StateObject var dataManager = DataManager()
//    var body: some View {
//        NavigationView {
//            
//            ForEach(dataManager.Test3, id: \.id) {  bus in
//                HStack  {
//                    List{
//                        
//                        
//                        Spacer()
//                        VStack(alignment: .center, spacing: 5) {
//                            //                        Text("Sarah")
//                            
//                            Text (bus.Name)
//                            
//                                .multilineTextAlignment(.center)
//                                .frame(width: 150, height: 50)
//                                .bold()
//                                .modifier(ProviderNameTextModifier())
//                            Text("Hair style")
//                            
//                                .modifier(ProviderCatigoryTextModifier())
//                            
//                            /* star stack */
//                            HStack(spacing: 2) {
//                                ForEach(1...4, id: \.self) { stars in
//                                    // Reviewer evaluation stars:
//                                    Image(systemName: "star.fill")
//                                        .foregroundColor(Color("yellowFill"))
//                                        .font(.system(size: 15))
//                                }
//                                
//                            }
//                            //.padding()
//                            
//                            //                            Text("Show more")
//                            .padding(.vertical)
//                            
//                            NavigationLink(destination: ProviderInfo(businessData: bus)){
//                                Text("Show more")
//                                    .bold()
//                                    .modifier(SmallButtonModifier())
//                                
//                            }
//                            //                        Button {
//                            //                            // ContentView()
//                            //                        } label: {
//                            //                            Text("Show more")
//                            //                                .bold()
//                            //                                .modifier(SmallButtonModifier())
//                            //                        }
//                        } // end of VStack
//                        
//                        Spacer()
//                        Image("anood")
//                            .resizable()
//                            .frame(width: 207, height: 164)
//                        
//                    }//for
//                }// End of HStack image with contents
//                // }
//                .frame(width: 359.45, height: 166)
//                .background(Color("Lgreen"))
//                .cornerRadius(5)
//                .listRowSeparator(.hidden)
//            }
//            //MARK: -
////            List{
////                //(dataManager.business_Testing, id: \.id) { bus in
////                ForEach(dataManager.business_info, id: \.id) {  bus in
////                    HStack{
////
////                        KFImage(URL(string: bus.ima)!)
////                            .resizable()
////                            .frame(width: 150, height: 166)
////
////                        VStack(alignment: .leading, spacing:6){
////                            Text("---")
////                            Text (bus.Name)
////                            Text("---")
////                            Text (bus.City)
////                            Text("---")
////                            Text (bus.Categorie)
////                            Text("---")
//////                            KFImage(URL(string: bus.ima)!)
//////                                .resizable()
//////                                .frame(width: 100, height: 100)
////
////                        }
////                    }
////                }
////            }//list
//            .navigationTitle ("Names")
//        }
//        //        .onAppear(perform: {
//        //            withAnimation(Animation.spring().delay(0.9)) {
//        //                fetchData()
//        //            }}
//        //            )
//    }
//    
//    
//    
//    
//    //    func fetchData()
//    //    {
//    //
//    //        print("test")
//    //        for item in dataManager.business_info
//    //        {
//    //
//    //            print(item.Name)
//    //            print(item.Categorie)
//    //            print(item.City)
//    //
//    //
//    //        }
//    //
//    //
//    //}
//    
//}
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
//
//
