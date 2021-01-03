//
//  ContentView.swift
//  BrainTraining
//
//  Created by Alison Gorman on 1/1/21.
//

import SwiftUI

struct ContentView: View {
    @State var appMove = Int.random(in: 0...2)
    @State var shouldWin = Bool.random()
    @State var score = 0
    @State var scoreTitle = ""
    @State var turn = 0
    @State var showingScore = false
    
    var moves = ["Rock👊", "Paper🤚", "Scissors✌️"]
    
    var body: some View {
        VStack {
            Text("BRAIN TRAINING")
            .font(.headline)
            .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack{
                if shouldWin {
                    Text("WIN")
                        .font(.title)
                    } else {
                        Text("LOSE")
                            .font(.title)
                    }
                Text("vs")
                Text("\(moves[appMove])")
                    .font(.title)
            }
            .padding(.bottom)
            
            VStack(spacing: 20){
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.buttonTapped(number)
                    }) {
                        Text(self.moves[number])
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 200.0, height: 50.0)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                    .padding(5.0)
                }
            }
            .alert(isPresented: $showingScore) {
                            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                                self.startOver()
                            })
                        }

            
            Spacer()
        }
    }


func buttonTapped(_ play: Int) {
    var playerWins:  Bool  {
        if (play == 0 && appMove == 3) ||
            (play == 1 && appMove == 0) ||
            (play == 2 && appMove == 1) {
            return true
            }
        else {
            return false
        }
    }
    if (shouldWin && playerWins) || (!shouldWin && !playerWins) {
        print("+1")
        score += 1
        } else {
            print("-1")
            score -= 1
        }
    turn += 1
    
    if turn < 10 {
        appMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
        }
    else{
        showingScore = true
    }
    }

func startOver() {
    score = 0
    turn = 0
}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
