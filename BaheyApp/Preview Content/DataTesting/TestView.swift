//
//  TestView.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 14/02/2023.
//

import SwiftUI
import Kingfisher

// dogs = business_Testing
// Dog = businessbusiness
//id: id, Name: Name, City: City, Categorie: Categorie)

struct TestView: View {
    
    @EnvironmentObject var dataManager: DataManager
    
    
    //@StateObject var dataManager = DataManager()
    var body: some View {
        NavigationView {
            List{
                //(dataManager.business_Testing, id: \.id) { bus in
                ForEach(dataManager.Test3, id: \.id) {  bus in
                    HStack{
                        
                        KFImage(URL(string: bus.ima)!)
                            .resizable()
                            .frame(width: 150, height: 166)
                        
                        VStack(alignment: .leading, spacing:6){
                            Text("---")
                            Text (bus.Name)
                            Text("---")
                            Text (bus.City)
                            Text("---")
                            Text (bus.Categorie)
                            Text("---")
//                            KFImage(URL(string: bus.ima)!)
//                                .resizable()
//                                .frame(width: 100, height: 100)
                            
                        }
                    }
                }
            }
            .navigationTitle ("Names")
        }
        //        .onAppear(perform: {
        //            withAnimation(Animation.spring().delay(0.9)) {
        //                fetchData()
        //            }}
        //            )
    }
    
    
    
    
    //    func fetchData()
    //    {
    //
    //        print("test")
    //        for item in dataManager.Test3
    //        {
    //
    //            print(item.Name)
    //            print(item.Categorie)
    //            print(item.City)
    //
    //
    //        }
    //
    //
    //}
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}


