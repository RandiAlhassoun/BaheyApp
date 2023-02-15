//
//  Splash.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct Splash: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        ZStack{
            //Color("Dpink")
//            (Color("Dpink"))
//                .ignoresSafeArea()

            if isActive {
                OnBoarding()
            } else {
                
                ZStack{
                                (Color("Dpink"))
                                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Image("SplashWhiteLogo")
                            .resizable()
                            .frame(width: 200, height: 160)
                            .scaledToFit()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }.accentColor((Color("Dpink")))
                
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }//z
            }
            
        }//Z
    }//body
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}

