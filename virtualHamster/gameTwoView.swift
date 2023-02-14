//
//  gameTwoView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-02-14.
//

import SwiftUI

enum GameOption: String, CaseIterable {
    case rock, paper, scissors
}

struct gameTwoView: View {
        @State private var playerSelection: GameOption? = nil
        @State private var computerSelection: GameOption? = nil
        @State private var resultMessage: String = ""
        
        var body: some View {
            VStack {
                Text("Player: \(playerSelection?.rawValue ?? "")")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("Computer: \(computerSelection?.rawValue ?? "")")
                    .font(.largeTitle)
                
                Spacer()
                
                Text(resultMessage)
                    .font(.headline)
                
                Spacer()
                
                HStack {
                    ForEach(GameOption.allCases, id: \.self) { option in
                        Button(action: {
                            self.startGame(option: option)
                        }) {
                            Text(option.rawValue.capitalized)
                        }
                    }
                }
            }
        }
        
        func startGame(option: GameOption) {
            playerSelection = option
            computerSelection = GameOption.allCases.randomElement()
            
            switch (playerSelection, computerSelection) {
            case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
                resultMessage = "You win!"
            case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
                resultMessage = "It's a draw."
            default:
                resultMessage = "You lose."
            }
        }
    }

struct gameTwoView_Previews: PreviewProvider {
    static var previews: some View {
        gameTwoView()
    }
}
