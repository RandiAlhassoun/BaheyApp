//
//  MoreEmpty.swift
//  BaheyApp
//
//  Created by salma alorifi on 23/07/1444 AH.
//

import SwiftUI

struct MoreEmpty: View {
    @State private var showingOptions = false
    var body: some View {
        NavigationView{ //start Navigation View
            VStack(alignment: .leading){ // start v stack
                
                // MARK: - heeder
                VStack(alignment:.leading){
                    
                    Text("Hello")
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                    
                    Text ("Please Sign In ")
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                   
                }.padding()
                
                Spacer()
                HStack(){ //hstack for contect us with action button
                    Image(systemName:"envelope.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.gray)
                    Button("Contect us"){
                        showingOptions = true
                    }.modifier(RegularTextModifier()).bold()
                        .confirmationDialog("Connect by email", isPresented: $showingOptions, titleVisibility: .visible) {
                            Button("BaheyApp@gmail.com") {}
                        }
                        } // end hstack
                .padding()
                    
                HStack(){ // hstack with link to about us
                    NavigationLink(destination: AboutUs()){
                    Image(systemName:"bubble.left.and.bubble.right.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.gray)
                    Text("About us").modifier(RegularTextModifier()).bold()
                    //Spacer()
                }
                    } // end hstack
                .padding()
                    HStack(){ // hstack with link to add Business
                        NavigationLink(destination: AddBusiness()){
                            Image(systemName:"newspaper.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.gray)
                            Text("Add Your Business").modifier(RegularTextModifier()).bold() }
                        
                    }// end hstack
                    .padding()
                    
                // MARK: - Button
                
                    Spacer()
                    NavigationLink(destination: Login().navigationBarBackButtonHidden()
                    ){
                        Text("Sign In")
                            .modifier(LargeButtonModifier())
                    }
                  //Spacer()
                    NavigationLink(destination: SignUp().navigationBarBackButtonHidden()
                    ){
                        Text("Sign Up")
                            .modifier(LargeButtonModifier())
                    }
                    Spacer()
                }
                .padding()
                //.navigationBackButton(color: UIColor(red: 0.73, green: 0.41, blue: 0.43, alpha: 1.00),  text: "Back") //To use a custom color you have to get the UIColor from the hex using this website:https://www.uicolor.io
            
            //Modifiers to make the VStack as a block
               // .modifier(reviewBackgrounddModifier())
            }
    }
}

struct MoreEmpty_Previews: PreviewProvider {
    static var previews: some View {
        MoreEmpty()
    }
}
