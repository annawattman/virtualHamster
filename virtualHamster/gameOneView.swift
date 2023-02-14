//
//  gameOneView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-02-14.
//

import SwiftUI

struct gameOneView: View {
    @State private var showSpot = false
    @State private var score = 0
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.largeTitle)
            
            Spacer()
            
            if showSpot {
                SpotView(x: randomX(), y: randomY())
                    .onTapGesture {
                        self.score += 1
                        self.showSpot = false
                    }
            }
        }
        .onAppear(perform: startGame)
    }
    
    func startGame() {
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            self.showSpot.toggle()
        }
    }
    
    func randomX() -> CGFloat {
        CGFloat.random(in: 0...UIScreen.main.bounds.width - 50)
    }
    
    func randomY() -> CGFloat {
        CGFloat.random(in: 0...UIScreen.main.bounds.height - 50)
    }
}

struct SpotView: View {
    let color = Color.red
    let x: CGFloat
    let y: CGFloat
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 50, height: 50)
            .position(x: x, y: y)
    }
}

struct gameOneView_Previews: PreviewProvider {
    static var previews: some View {
        gameOneView()
    }
}
