//
//  OnBoarding.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct OnBoarding: View {
    @State private var currentTab = 0
    @State var isLinkActive = false
    
    @State var toContentView = false

    var body: some View {
        //NavigationView {
        VStack{
            HStack{
                Button {
                    toContentView.toggle()

                } label: {
                    Text("Skip")
                }.foregroundColor(Color("Dpink"))
                Spacer()
            }.padding()
            
        TabView(selection: $currentTab,
                content:  {
//MARK: - First onBording page
            VStack(){
                    Image ("OnBoarding1")
                        .resizable()
                    .frame(width: 300, height: 300)
                Text("A variety event service providers")
                    .modifier(EmptyStateTextModifier())
                    .padding()
                Text("Your guide to finding freelance event service providers according to your preferences.")
                    .multilineTextAlignment(.center)
                    .modifier(RegularTextModifier())
                
//                Button {
//                    toContentView.toggle()
//                } label: {
//                Text("Next")
//                    
//               }.modifier(MediemButtonModifier())
            }.tag(0)
//MARK: - Second onBording page
            VStack(){
                VStack(){
                    Image ("OnBoarding2")
                        .resizable()
                    .frame(width: 300, height: 300)}
                Text("Trusted reviews")
                    .modifier(EmptyStateTextModifier())
                
                    .padding()
                Text("We provide reliable ratings of service providers without any impartiality to ensure quality.")
                    .multilineTextAlignment(.center)
                    .modifier(RegularTextModifier())
                    .padding()
                
//                Button {
//                    toContentView.toggle()
//                } label: {
//                Text("Next")
//
//               }.modifier(MediemButtonModifier())
                
                
            }.tag(1)
//MARK: - Theered onBording page
            VStack(){
                VStack(){
                    Image ("OnBoarding3")
                        .resizable()
                    .frame(width: 300, height: 300)}
                Text("don’t hesitate")
                    
                    .modifier(EmptyStateTextModifier())
                    .padding()
                Text("Be part of our world and enjoy a diverse and ever-growing list of service providers.")
                    .multilineTextAlignment(.center)
                    .modifier(RegularTextModifier())
                
                Button {
                    toContentView.toggle()
                } label: {
                Text("Explore")
                    
               }.modifier(MediemButtonModifier())
                
                
            }.tag(2)
        }).tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        //.navigationBarHidden(true)
        
        
        
        //}//nav
            .fullScreenCover(isPresented: $toContentView) {
                TabBar()
            }
        //        .navigationBarHidden(true)
    }
    }
    }

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
