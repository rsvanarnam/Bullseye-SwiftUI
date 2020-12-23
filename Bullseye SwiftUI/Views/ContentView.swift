//
//  ContentView.swift
//  Bullseye SwiftUI
//
//  Created by Rebecca Van Arnam on 12/16/20.
//



import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.5
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                //Spacer()
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                    .transition(.scale)
                }
                //Spacer()
            }
            if !alertIsVisible {
            SliderView(sliderValue: $sliderValue)
                .transition(.scale)
            }
        }
    }
}
                                                                                                                
struct InstructionsView: View {
    
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)

            
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        VStack {
            HStack {
                SliderLabelText(text: "1")
                Slider(value: $sliderValue, in: 1.0...100.0)
                SliderLabelText(text: "100")
            }
            .padding()
        }
    }
}

struct HitMeButton: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
            alertIsVisible = true
            }
        }) {
            HitMeButtonStyle(text: "Hit Me")
                
          /*
        .alert(isPresented: $alertIsVisible,
               content: {
                let roundedValue = Int(sliderValue.rounded())
                let points = game.points(sliderValue: roundedValue)
                return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(roundedValue).\n" +
                                                                            "You scored \(points) points this round."), dismissButton: .default(Text("Awesome!")){       game.startNewRound(points: points)}
                
                )
               })
             */
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
