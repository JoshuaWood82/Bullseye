//
//  AboutView.swift
//  Bullseye
//
//  Created by Joshua Wood on 1/16/21.
//

import SwiftUI

struct AboutView: View {
    
// Constants
//======================================
    let beige = Color(red: 1.0, green: 0.84, blue: 0.70)
    
    var body: some View {
        Group {
        VStack {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
        Text("🎯 Bullseye 🎯")
            .modifier(AboutHeadingStyle())
            .navigationBarTitle("About Bullseye")
            Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.")
                .modifier(AboutBodyStyle())
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.")
                .modifier(AboutBodyStyle())
            Text("Enjoy!")
                .modifier(AboutBodyStyle())
    }
        .background(beige)
    }
        .background(Image("Background"))
    }
//View Modifier
//=====================================
        struct AboutHeadingStyle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(Font.custom("Arial Rounded MT Bold", size: 30))
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
            }
        }
        struct AboutBodyStyle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(Font.custom("Arial Rounded MT Bold", size: 16))
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
            }
        }
        
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
