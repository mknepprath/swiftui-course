//
//  ContentView.swift
//  day35-MultiplicationChallenge
//
//  Created by Michael Knepprath on 8/12/20.
//

import SwiftUI

struct GameMode: Hashable {
    var name: String
    var value: Int
}

struct Question {
    var int1: Int
    var int2: Int
}

struct ContentView: View {
    @State private var upTo = 4
    @State private var gameMode = 0
    @State private var playingGame = false
    @State private var currentQuestion = 0
    @State private var userInput = ""
    @State private var score = 0
    
    var gameModes: [GameMode] {
        return [
            GameMode(name: "5", value: 5),
            GameMode(name: "10", value: 10),
            GameMode(name: "20", value: 20),
            GameMode(name: "All", value: upTo * upTo)
        ]
    }
    
    var questions: [Question] {
        var q: [Question] = []
        for _ in 0 ..< gameModes[gameMode].value {
            q.append(Question(int1: Int.random(in: 1...upTo), int2: Int.random(in: 1...upTo)))
        }
        return q
    }
    
    var body: some View {
        if playingGame == false {
            Group {
                Text("\(upTo)").padding()
                
                Section(header: Text("Up to...")) {
                    Stepper(value: $upTo, in: 1...12) {
                        Text("\(upTo)")
                    }
                }
                
                Section(header: Text("How many questions?")) {
                    Picker("How many questions?", selection: $gameMode) {
                        ForEach(0 ..< self.gameModes.count) {
                            Text("\(self.gameModes[$0].name)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(gameModes[gameMode].value) questions")
                }
                
                Section {
                    Button("Start") {
                        playingGame = true
                    }
                }
                
            }
        } else {
            Group {
                Text("Playing game.")
            }
            Section {
                Text("\(questions[currentQuestion].int1)x\(questions[currentQuestion].int2)")
                TextField("Solution", text: $userInput)
                Button("Submit") {
                    print(userInput, questions[currentQuestion])
                    
                    if Int(userInput) == questions[currentQuestion].int1 * questions[currentQuestion].int2 {
                        score += 1
                    }
                    
                    currentQuestion += 1
                }
                
                Text("\(score) correct")
                
                Button("Quit") {
                    playingGame = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
