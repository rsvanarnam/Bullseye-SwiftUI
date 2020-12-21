//
//  BackgroundView.swift
//  Bullseye SwiftUI
//
//  Created by Rebecca Van Arnam on 12/20/20.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    //@Binding var score: Double
    //@Binding var round: Int
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }) {
            RoundedImageViewStroked(systemName:"arrow.counterclockwise")
        }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}
struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        LabelText(text: title)
        RoundRectTextView(text: text)
            .frame(width: 56.0, height: 56.0)
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
            HStack {
                VStack {
            NumberView(title: "Score", text: String(game.score))
                }
                Spacer()
                VStack {
            NumberView(title: "Round", text: String(game.round))
                }
        }
    }
}

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
            Circle()
                .stroke(lineWidth: 20.0)
                .fill(
                    RadialGradient(gradient:
                                    Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
                )
                .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
