//
//  AllModifiers.swift
//  BaheyApp
//
//  Created by Rand Alhassoun on 07/02/2023.
//
/**NOTE**/
/**
 This is how to use the modifier in your code:
 Text("Hi").modifier(ModifierName())
 
 **/
//--------------------------
/*
 Button {
 print("Button was tapped")
} label: {
 Text("Login")
     .modifier(ButtonModifier())
}
 */

import SwiftUI
//Large Button Modifier:
struct LargeButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        //.bold()
            .font(.system(size: 20))
            .background(Color("Dpink"))
            .frame(width: 365 , height: 42)
            .cornerRadius(5.0)
            .foregroundColor(.white)
    }}
struct AllModifiers: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
//Mediem Button Modifier:
struct MediemButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        //.bold()
            .font(.system(size: 20))
            .background(Color("Dpink"))
            .frame(width: 165 , height: 45)
            .cornerRadius(15.0)
            .foregroundColor(.white)
    }}

//Small Button Modifier:
struct SmallButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        //.bold()
            .font(.system(size: 12))
            .background(Color("Dpink"))
            .frame(width: 89.11 , height: 25)
            .cornerRadius(20.0)
            .foregroundColor(.white)
    }}

//Empty State Text Modifier:
struct EmptyStateTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.system(size: 18))
            .foregroundColor(.black)
    }}

//Regular Text Modifier:
//***NOTE: Used for onboarding, AboutUs, AddBusiness, provider info details in ServiceProviderInfo***//
struct RegularTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding()
    }}

//XL Text Modifier:
//***NOTE: Used for provider Name in ServiceProviderInfo, explore***//
struct XLTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 32))
            .bold()
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding()
    }}

//Provider Name Text Modifier:
//***NOTE: Used for provider Name in ExploreCategories***//
struct ProviderNameTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .foregroundColor(.black)
            .padding()
    }}

//Provider Header Text Modifier:
//***NOTE: Used for provider categoty in ServiceProviderInfo***//
struct ProviderCatigoryTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 10))
            .bold()
            .foregroundColor(.black)
            .padding()
    }}
//Provider Header Text Modifier:
//***NOTE: Used for provider categoty in ServiceProviderInfo***//
struct ItemsModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .bold()
            .foregroundColor(.black)
            .padding()
    }}






struct AllModifiers_Previews: PreviewProvider {
    static var previews: some View {
        AllModifiers()
    }
}


