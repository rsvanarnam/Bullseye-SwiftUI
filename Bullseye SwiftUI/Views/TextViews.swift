//
//  TextViews.swift
//  Bullseye SwiftUI
//
//  Created by Rebecca Van Arnam on 12/20/20.
//

import SwiftUI

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
                               
struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
    Text(text)
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
        }
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        TextViewPreviewView()
        TextViewPreviewView()
            .preferredColorScheme(.dark)
    }
}
