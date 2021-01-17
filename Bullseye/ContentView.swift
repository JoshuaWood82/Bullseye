//
//  ContentView.swift
//  Bullseye
//
//  Created by Joshua Wood on 1/13/21.
//

import SwiftUI

struct ContentView: View {
//Properties
//================================================
    
//Game Stats
//================================================
    let midnightBlue = Color(red: 0, green: 0.2, blue: 0.4)
    @State var score = 0
    @State var round = 1
    
//User interface views
//================================================
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    var sliderValueRounded: Int {
        Int(sliderValue.rounded())
    }
    var sliderTargetDifference: Int {
        abs(sliderValueRounded - target)
        
    }

//user interface content and layout
//================================================
    var body: some View {
        NavigationView {
            VStack{
                Spacer().navigationBarTitle("🎯 Bullseye 🎯")
                
    //target row
    //================================================
                HStack {
                    Text("Put the bullseye as close as you can to:")
                        .modifier(LabelStyle())
                    Text("\(target)")
                        .modifier(ValueStyle())
                }
                Spacer()
                
    //slider row
    //================================================
                HStack {
                    
                    Text("1")
                        .modifier(LabelStyle())
                    Slider(value: $sliderValue, in: 1...100)
                        .accentColor(.green)
                        .animation(.easeOut)
                    Text("100")
                        .modifier(LabelStyle())
                }
                .padding(.horizontal)
                Spacer()
                
    //Button row
    //================================================
                Button(action: {
                    print("Points awarded: \(self.pointsForCurrentRound())")
                    self.alertIsVisible = true
                    
                    }) {
                    Text("Hit me!")
                        .modifier(ButtonLargeTextStyle())
                }
                .background(Image("Button-Normal"))
                .modifier(Shadow())
            
                .alert(isPresented: $alertIsVisible) {
                    Alert(title: Text(alertTitle()),
                          message: Text(scoringMessage()),
                          dismissButton: .default(Text("Awesome!")) {
                            self.startNewRound()
                          })
                          }
            
                Spacer()
                
    //score row
    //================================================
                HStack {
                    Button(action: {
                        self.startNewGame()
                    }) {
                        HStack {
                            Image("StartOverIcon")
                            Text("Start Over").modifier(ButtonsmallTextStyle())
                        }
                    }
                    .background(Image("Button-Normal"))
                    .modifier(Shadow())
                
                    
                    Spacer()
                    Text("Score:").modifier(LabelStyle())
                    Text("\(score)").modifier(ValueStyle())
                    Spacer()
                    Text("Round:").modifier(LabelStyle())
                    Text("\(round)").modifier(ValueStyle())
                    Spacer()
                    NavigationLink(destination: AboutView()) {
                        HStack {
                            Image("InfoButton")
                            Text("Info").modifier(ButtonsmallTextStyle())
                        }
                    }
                                .background(Image("Button-Normal"))
                        
                    
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
        
                .background(Image("Background"))
            
            
            .padding(.bottom, 20)
        .accentColor(midnightBlue)
            .padding(.horizontal)
        
            }
        
        
//methods
//=================================================
}
        func pointsForCurrentRound() -> Int {
            let maximumScore = 100
            let points: Int
            if sliderTargetDifference == 0 {
                points = 200
            } else if sliderTargetDifference == 1 {
                points = 150
            } else {
                return maximumScore - sliderTargetDifference
            }
            return points
        }
            func scoringMessage() -> String {
                return "The slider's value is \(sliderValueRounded).\n" + "The target value is \(target).\n" + "You scored \(pointsForCurrentRound()) points this round."
            }
    func alertTitle() -> String {
        let difference: Int = abs(sliderValueRounded - target)
        let title: String
        if sliderTargetDifference == 0 {
            title = "Perfect!"
        } else if sliderTargetDifference < 5 {
            title = "You almost had it!"
        } else if sliderTargetDifference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
                }
                return title
                }
    func startNewGame() {
        score = 0
        round = 1
        resetSliderandTarget()
    }
    func startNewRound() {
        score = score + pointsForCurrentRound()
        round = round + 1
        resetSliderandTarget()
    }
    func resetSliderandTarget() {
        sliderValue = Double.random(in:1...100)
        target = Int.random(in: 1...100)
    }
//View Modifiers
//==================================================
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .foregroundColor(.white)
                .modifier(Shadow())
        
        }
    }
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .foregroundColor(.yellow)
                .modifier(Shadow())
        }
        }
        struct Shadow: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
            }
        }
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .foregroundColor(.black)
        }
    }
    struct ButtonsmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
                .foregroundColor(.black)
        }
    }
//preview
//==================================================
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewLayout(.device)

        }
    }
}

