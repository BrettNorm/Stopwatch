//
//  CustomButton.swift
//  Stopwatch
//
//  Created by Brett Bax on 10/3/21.
//
// Some of these button stylings are ripped from the internet.
// I am severely lacking in creativity.

import Foundation
import SwiftUI

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    
    var body: some View {
        Text(label)
            .frame(width: 50, height: 30, alignment: .center)
            .foregroundColor(.white)
            .padding(.vertical, 25)
            .padding(.horizontal, 50)
            .background(buttonColor)
            .cornerRadius(25)
    }
}


struct SwipeButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(configuration)
            .gesture(
                DragGesture()
                    .onEnded { _ in
                        configuration.trigger()
                    }
            )
    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label.foregroundColor(.black)
                .shadow(
                    color: configuration.isPressed ? Color.gray : Color.black,
                    radius: 4, x: 0, y: 5
                )
        }
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
