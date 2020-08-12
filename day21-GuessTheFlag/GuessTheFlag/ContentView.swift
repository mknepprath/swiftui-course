//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Michael Knepprath on 7/29/20.
//

import SwiftUI

// MARK: 1. Stacking up buttons
// Nesting lots of stacks is ok. And normal!

// MARK: 2. Showing the player’s score with an alert
// ...

// MARK: Day 24: Create a FlagImage() view
struct FlagImage: View {
    var country: String

    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var animationAmount = 0.0
    @State private var animationAmountWrong = 0.0
    @State private var opacityAmount = 1.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle) // <- Dynamic type!
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        withAnimation(.interpolatingSpring(stiffness: 6, damping: 6)) {
                            self.flagTapped(number)
                            
                            if number == correctAnswer {
                                self.animationAmount += 360
                            } else {
                                self.animationAmountWrong += 360
                            }
                            
                            self.opacityAmount = 0.25
                        }
                    }) {
                        FlagImage(country: self.countries[number])
                    }
                    .rotation3DEffect(number == correctAnswer ? .degrees(animationAmount) : .degrees(0.0), axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(number != correctAnswer ? .degrees(0.0) : .degrees(animationAmountWrong), axis: (x: 0, y: 0, z: 1))
                    .opacity(number != correctAnswer ? opacityAmount : 1)
                }
                
                Text("\(score) points")
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(
                title: Text(scoreTitle),
                message: Text(scoreMessage),
                dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                }
            )
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong!"
            scoreMessage = "That's the flag of \(countries[number])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        
        animationAmount = 0.0
        animationAmountWrong = 0.0
        opacityAmount = 1.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
