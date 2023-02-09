//
//  More.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI

struct More: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Hello, person").modifier(RegularTextModifier())
                    .fontWeight(.bold)
                Text("email@ email.com").modifier(RegularTextModifier())
                    .fontWeight(.semibold)
                Spacer()
                
            }
            
        }
    }
}

struct More_Previews: PreviewProvider {
    static var previews: some View {
        More()
    }
}
