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
            .frame(width: 365 , height: 42)
            .foregroundColor(.white)
            .background(Color("Dpink"))
            .cornerRadius(5.0)
            .font(.system(size: 20))
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
            .frame(width: 165 , height: 45)
            .foregroundColor(.white)
            .background(Color("Dpink"))
            .cornerRadius(15.0)
            .font(.system(size: 20))
        
    }}

//Small Button Modifier:
struct SmallButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        //.bold()
        
            .frame(width: 89.11 , height: 25)
            .foregroundColor(.white)
            .background(Color("Dpink"))
            .cornerRadius(20.0)
            .font(.system(size: 12))
    }}

//Empty State Text Modifier:
struct EmptyStateTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.system(size: 18))
            .foregroundColor(.black)
            //.padding()
            
    }}

//Regular Text Modifier:
//***NOTE: Used for onboarding, AboutUs, AddBusiness, provider info details in ServiceProviderInfo***//
struct RegularTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .foregroundColor(.black)
            //.frame(maxWidth: .infinity)
            //.padding()
    }}

//XL Text Modifier:
//***NOTE: Used for provider Name in ServiceProviderInfo, explore***//
struct XLTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 32))
            .bold()
            .foregroundColor(.black)
            //.frame(maxWidth: .infinity)
            //.padding()
    }}

//Provider Name Text Modifier:
//***NOTE: Used for provider Name in ExploreCategories***//
struct ProviderNameTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .foregroundColor(.black)
           // .padding()
    }}

//Provider Header Text Modifier:
//***NOTE: Used for provider categoty in ServiceProviderInfo***//
struct ProviderCatigoryTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 10))
            .bold()
            .foregroundColor(.black)
            //.padding()
    }}
//Provider Header Text Modifier:
//***NOTE: Used for provider categoty in ServiceProviderInfo***//
struct ItemsModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .bold()
            .foregroundColor(.black)
            //.padding()
    }}


struct ProviderInfoHeadersTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.system(size: 20))
            .foregroundColor(.black)
            //.frame(maxWidth: .infinity)
            //.padding()
    }}
// AccentTextModifier used for "More" in ProviderInfo page
struct AccentTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .foregroundColor(Color("Dpink"))
            //.frame(maxWidth: .infinity)
            //.padding()
    }}
struct WriteReviewHeadersModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.system(size: 22))
            .foregroundColor(.black)
            //.frame(maxWidth: .infinity)
            //.padding()
    }}
// Modifier for Hstack that holds each TextField
struct reviewTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(4, reservesSpace: true)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity , maxHeight: 145 , alignment: .topLeading)
                        .padding()
                        .background((Color("Lgreen")).clipShape(RoundedRectangle(cornerRadius:10)))
    }
}
// Modifier for review Backgroundd used in ViewAllReviews
struct reviewBackgrounddModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 170 , alignment: .leading)
            .background(Color("Lgreen"))
            .cornerRadius(10)
    }
}


struct NavigationBackButton: ViewModifier {

    @Environment(\.presentationMode) var presentationMode
    var color: UIColor
    var text: String?

    func body(content: Content) -> some View {
        return content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {  presentationMode.wrappedValue.dismiss() }, label: {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(color))

                        if let text = text {
                            Text(text)
                                .foregroundColor(Color(color))
                        }
                    }
                })
            )
    }
}

extension View {
    func navigationBackButton(color: UIColor, text: String? = nil) -> some View {
        modifier(NavigationBackButton(color: color, text: text))
    }
}


struct AllModifiers_Previews: PreviewProvider {
    static var previews: some View {
        AllModifiers()
    }
}

