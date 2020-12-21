//
//  RoundViews.swift
//  Bullseye SwiftUI
//
//  Created by Rebecca Van Arnam on 12/20/20.
//

import SwiftUI

struct HitMeButtonStyle: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.title3)
            .padding(20.0)
            
    .background(
        ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
    .foregroundColor(Color.white)
    .cornerRadius(21.0)
    .overlay(
        RoundedRectangle(cornerRadius: 21.0)
            .strokeBorder(Color.white, lineWidth: 2.0)
        )
    }
}

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
            .background(
                Circle()
                .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .font(.title2)
            .bold()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .foregroundColor(Color("TextColor"))
            .frame(width: 68.0, height: 56.0)
            .overlay(
        RoundedRectangle(cornerRadius: 21.0)
            .stroke(lineWidth: 2.0)
            .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack {
            HitMeButtonStyle(text: "Hit me")
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "100")
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}

