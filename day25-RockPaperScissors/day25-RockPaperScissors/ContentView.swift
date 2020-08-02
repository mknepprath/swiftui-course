//
//  ContentView.swift
//  day25-RockPaperScissors
//
//  Created by Michael Knepprath on 8/2/20.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var gameMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    @State private var numberOfMoves = 0
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoreMessage = ""
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
             
            VStack(spacing: 30) {
                VStack {
                    Text(shouldWin ? "What wins against" : "What loses against")
                        .foregroundColor(.white)
                    Text(moves[gameMove])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { index in
                    Button(action: {
                        self.moveTapped(index)
                    }) {
                        Text(self.moves[index])
                    }
                }
                
                if numberOfMoves <= 9 {
                    Text("Round \(numberOfMoves + 1)")
                        .foregroundColor(.white)
                } else {
                    Text("Game Over!")
                        .foregroundColor(.white)
                }
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(
                title: Text(scoreTitle),
                message: Text(scoreMessage),
                dismissButton: .default(Text("Continue")) {
                    if numberOfMoves <= 9 {
                        self.nextMove()
                    } else {
                        self.nextGame()
                    }
                }
            )
        }
    }
    
    func moveTapped(_ yourMove: Int) {
        numberOfMoves += 1
        
        if (moves[gameMove] == "Scissors" && (
                (moves[yourMove] == "Rock" && shouldWin) ||
                (moves[yourMove] == "Paper" && !shouldWin)
        )) {
            score += 1
            scoreTitle = "Right!"
        } else if (moves[gameMove] == "Rock" && (
                (moves[yourMove] == "Paper" && shouldWin) ||
                (moves[yourMove] == "Scissors" && !shouldWin)
        )) {
            score += 1
            scoreTitle = "Right!"
        } else if (moves[gameMove] == "Paper" && (
                (moves[yourMove] == "Scissors" && shouldWin) ||
                (moves[yourMove] == "Rock" && !shouldWin)
        )) {
            score += 1
            scoreTitle = "Right!"
        } else {
            score -= 1
            scoreTitle = "WRONG"
        }
        
        if numberOfMoves == 10 {
            scoreTitle = "Nice work!"
            scoreMessage = "You scored \(score) points."
        } else {
            scoreMessage = "\(10 - numberOfMoves) turns remaining"
        }
        
        showingScore = true
    }
    
    func nextMove() {
        moves.shuffle()
        gameMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func nextGame() {
        self.nextMove()
        numberOfMoves = 0
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
