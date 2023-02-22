//
//  gameTwoView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-02-14.
//
import SwiftUI

enum GameOption: String, CaseIterable {
    case rock, paper, scissor
    
    var image: Image {
        switch self {
        case .rock:
            return Image("rock")
        case .paper:
            return Image("paper")
        case .scissor:
            return Image("scissor")
        }
    }
}
struct gameTwoView: View {
    @State private var playerSelection: GameOption? = nil
    @State private var computerSelection: GameOption? = nil
    @State private var resultMessage: String = ""
    @EnvironmentObject var vm : ViewModel
    @State private var score = 0
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack {
            Button(action: {
                print("Button tapped")
                print("point before: \(vm.pet.points)")
                vm.pet.points += score
                print("point after: \(vm.pet.points)")
                self.presentation.wrappedValue.dismiss()
                
            }, label: {
                Text("Go Back")
                    .font(.system(size: 16))
                    .padding(8)
            })
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(10)
            .padding(.leading, 20)
            .padding(.top, 10)
            .navigationBarBackButtonHidden(true)
            /*
            Text("Player: \(playerSelection?.rawValue ?? "")")
                .font(.largeTitle)
            
            Spacer()
            
            Text("Computer: \(computerSelection?.rawValue ?? "")")
                .font(.largeTitle)
            */
            HStack {
                Text("Player:")
                    .font(.largeTitle)
                playerSelection?.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
            .padding()

            Spacer()

            HStack {
                Text("Computer:")
                    .font(.largeTitle)
                computerSelection?.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
            .padding()
            
            Spacer()
            
            Text(resultMessage)
                .font(.headline)
            
            Spacer()
            
            HStack {
                ForEach(GameOption.allCases, id: \.self) { option in
                    Button(action: {
                        self.startGame(option: option)
                    }) {
                        Image(option.rawValue)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                }
            }
            
            Spacer()
            
            Text("Score: \(score)") // Display player's score
        }
    }
    
    func startGame(option: GameOption) {
        playerSelection = option
        computerSelection = GameOption.allCases.randomElement()
        
        switch (playerSelection, computerSelection) {
        case (.rock, .scissor), (.paper, .rock), (.scissor, .paper):
            resultMessage = "You win!"
            score += 1 // Increase player's score by 1 when they win
        case (.rock, .rock), (.paper, .paper), (.scissor, .scissor):
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
