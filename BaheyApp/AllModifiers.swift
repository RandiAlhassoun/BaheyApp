//
//  AllModifiers.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//

import SwiftUI
struct LargeButtonModifier: ViewModifier {
func body(content: Content) -> some View {
content
//.bold()
.font(.system(size: 28))
.background(Color("Dpink"))
.frame(width: 365 , height: 42)
                 }}
struct AllModifiers: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


  
struct AllModifiers_Previews: PreviewProvider {
    static var previews: some View {
        AllModifiers()
    }
}

               
