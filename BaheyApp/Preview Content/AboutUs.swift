//
//  AboutUs.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct AboutUs: View {
    var body: some View {
        VStack{
            Text("About us")
                .modifier(XLTextModifier())
                .padding()
            //Spacer()
            Image("Blogo")
                .resizable()
                .frame(width: 109, height: 109)
                .padding()
            //Spacer()
            Text("Bahey application aims to offer the services of freelancers specializing in events such as hairdressers, beauticians, photographers and many other fields. If you are a service provider, we welcome you to join us.")
                .modifier(EmptyStateTextModifier())
                //.multilineTextAlignment(.center)
                .padding()
           // Spacer()
            HStack{
                Image("instagram")
                    .resizable()
                    .frame(width: 60, height: 60)
                Image("mail")
                    .resizable()
                    .frame(width: 60, height: 60)
               
            }
            .padding()
            Spacer()
        }
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
