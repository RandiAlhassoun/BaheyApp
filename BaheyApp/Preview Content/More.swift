//
//  More.swift
//  Bahey1
//
//  Created by salma alorifi on 17/07/1444 AH.
////
//  More.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct More: View {
    @State private var showingOptions = false
    @State private var selection = "None"
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                // MARK: - heeder
                VStack(alignment:.leading){
                    
                    Text("Hello, person")
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                    
                    Text ("person@email.com")
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                    
                    // Spacer()
                }.padding()
                
                Spacer()
                HStack(){
                    
                    Image(systemName:"envelope.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.gray)
                    Button("Contect us"){
                        showingOptions = true
                    }.modifier(RegularTextModifier()).bold()
                        .confirmationDialog("Connect by email", isPresented: $showingOptions, titleVisibility: .visible) {
                           
            
                            Button("BaheyApp@gmail.com") {
                                
                            }
                        }
                            
                            
                            //Spacer()
                        }.padding()
                    
                HStack(){
                    NavigationLink(destination: AboutUs()){
                    Image(systemName:"bubble.left.and.bubble.right.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.gray)
                    Text("About us").modifier(RegularTextModifier()).bold()
                    //Spacer()
                }
                    }.padding()
                    HStack(){
                        NavigationLink(destination: AddBusiness()){
                            Image(systemName:"newspaper.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.gray)
                            Text("Add Your Business").modifier(RegularTextModifier()).bold()
                        }
                        
                        //Spacer()
                    }.padding()
                    
                    
                    Spacer()
                    NavigationLink(destination: Logout()//.navigationBarBackButtonHidden()
                    ){
                        Text("Sign Out")
                            .modifier(LargeButtonModifier())
                    }
                    ///.padding()
                    NavigationLink(destination: DeleteAccount()//.navigationBarBackButtonHidden()
                    ){
                        Text("Delete Account")
                            .modifier(LargeButtonModifier())
                    }
                    Spacer()
                    //.padding()
                    
                    //  Spacer()
                }
                .padding()
                // Spacer()
            }
            
        }
    }


struct More_Previews: PreviewProvider {
    static var previews: some View {
        More()
    }
}


