//
//  AboutUs.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct AboutUs: View {
    
@State private var showingOptions = false
    
var body: some View {
        VStack{
            // start of Vstack
            
            // MARK: - Logo Image
            Image("NewLogo")
                .resizable()
                .frame(width: 109, height: 109)
                .padding()
            
            // MARK: - text
            Text("Bahey application aims to offer the services of freelancers specializing in events such as hairdressers, beauticians, photographers and many other fields. If you are a service provider, we welcome you to join us.")
                .modifier(EmptyStateTextModifier())
            //.multilineTextAlignment(.center)
                .padding()
            
            
            // MARK: - action buttons 
            VStack(alignment: .center){
                HStack{
                    Button(action: {
                        //NOTE: Add your link here in: let yourURL = URL(string:"HERE")
                        if let yourURL = URL(string: "https://www.instagram.com/bahey_app/?igshid=YmMyMTA2M2Y%3D") {
                            UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                        }
                        
                    }, label: {
                        Image( "instagram") // <- Change icon to your preferred one
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue)
                
                    })
                    
                    Button(){
                        showingOptions = true
                    } label: {
                        Image("mail") // <- Change icon to your preferred one
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue)
                            .modifier(RegularTextModifier()).bold()
                            .confirmationDialog("Connect by email", isPresented: $showingOptions, titleVisibility: .visible) {
                                Button("BaheyApp@gmail.com") {}
                            }
                    }
                }
            }
            .padding()
            Spacer()
            
        }.navigationTitle("About us")
            .modifier(XLTextModifier())
            .padding()
    // end v stack
    
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
