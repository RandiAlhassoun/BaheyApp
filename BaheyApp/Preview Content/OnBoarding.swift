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
        TabView(selection: $currentTab,
                content:  {
            VStack(){
                VStack(){
                    HStack{
                        Button {
                        } label: {
                            Text("تخطي")
                        }.foregroundColor(Color("Dpink"))
                        
                        Spacer()
                        
                    }.frame(alignment: .top)
                    
                    Image ("OnBoarding1")
                        .resizable()
                    .frame(width: 300, height: 300)}
                Text("العديد من مزودي خدمات المناسبات")
                    .modifier(EmptyStateTextModifier())
                    .padding()
                Text("دليلك للوصول لمزودي خدمات المناسبات من أصحاب الأعمال الحرة بما يتناسب مع اختياراتك.")
                    .multilineTextAlignment(.center)
                    .modifier(RegularTextModifier())
                
                
            }.tag(0)
            VStack(){
                VStack(){
                    Image ("OnBoarding2")
                        .resizable()
                    .frame(width: 300, height: 300)}
                Text("تقييمات موثوقة")
                    .bold()
                    .modifier(EmptyStateTextModifier())
                
                    .padding()
                Text("نوفر تقييمات موثوقة لمزودي الخدمات بدون أي حياد لضمان الجودة. ")
                    .multilineTextAlignment(.center)
                    .modifier(RegularTextModifier())
                
            }.tag(1)
            VStack(){
                VStack(){
                    Image ("OnBoarding3")
                        .resizable()
                    .frame(width: 300, height: 300)}
                Text("لا داعي للحيرة")
                    .modifier(EmptyStateTextModifier())
                    .padding()
                Text("كوني جزءً من عالمنا و استمتعي بقائمة متنوعة و متجددة من مزودي الخدمات.  ")
                    .multilineTextAlignment(.center)
                    .modifier(RegularTextModifier())
                
                
                
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
