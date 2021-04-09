 //
//  PointsView.swift
//  bullseye
//
//  Created by ira on 06.04.2021.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: "\(roundedValue)")
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }, label: {
                ButtonText(text: "Start New Round")
            })
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}
 struct Shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .stroke(Color.accentColor, lineWidth: 8.0)
                    .frame(width: 100, height: 100)
            }
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.accentColor, lineWidth: 8.0)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            Button(action: {
                wideShapes = !wideShapes
            }, label: {
                Text("Animate")
                    .font(.largeTitle)
            })
        }
    }
 }

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        Shapes()
    }
}
