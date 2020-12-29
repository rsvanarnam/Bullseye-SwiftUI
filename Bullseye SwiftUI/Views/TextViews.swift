//
//  TextViews.swift
//  Bullseye SwiftUI
//
//  Created by Rebecca Van Arnam on 12/20/20.
//

import SwiftUI

// Main screen - "Put the bullseye as close as you can to".
struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote) // Dynamic Type Sizes
            .foregroundColor(Color("TextColor"))
        
    }
}

// Main screen - for the randomly generated target number.
struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

// Main screen - Text on either side of the slider: "1" and "100".
struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.body)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

// Main screen - Score and Round text. 
struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
            .multilineTextAlignment(.center)
            .padding(0.5)
    }
}

// Hit me button alert - "You scored .... points".
struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
        
    }
}

// Hit me button alert - "Start New Round".
struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .bold()
            .foregroundColor(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}


// Leaderboard screen - leaderboard text.
struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
}

// Leaderboard screen - score text.
struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
        
    }
}

// Leaderboard screen - date text.
struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
        
    }
}


struct TextViewPreviewView: View {
    var body: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "100")
            LabelText(text: "Round")
            BodyText(text: "You scored 200 Points \n 🎉🎉🎉")
            ButtonText(text: "Start New Round")
            BigBoldText(text: "Leaderboard")
            ScoreText(score: 459)
            DateText(date: Date())
        }
        .padding()
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        TextViewPreviewView()
        TextViewPreviewView()
            .preferredColorScheme(.dark)
    }
}
