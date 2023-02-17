//
//  gameOneView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-02-14.
//
/*
import SwiftUI

struct gameOneView: View {
    @State private var showSpot = false
    @State private var score = 0
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            VStack {
                Text("Score: \(score)")
                    .font(.largeTitle)
                
                Spacer()
            }
            
            ZStack {
                Color.white
                if showSpot {
                    SpotView(x: randomX(), y: randomY())
                        .onTapGesture {
                            self.score += 1
                            self.showSpot = false
                        }
                }
            }
            .frame(width: 200, height: 200)
            .padding(.bottom, 50)
        }
        .onAppear(perform: startGame)
    }
    
    func startGame() {
        var counter = 0
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            self.showSpot.toggle()
            counter += 1
            if counter % 5 == 0 {
                timer.invalidate()
                let newTimeInterval = timer.timeInterval * 0.9 // reduce the time interval by 10%
                self.timer = Timer.scheduledTimer(withTimeInterval: newTimeInterval, repeats: true) { timer in
                    self.showSpot.toggle()
                }
            }
        }
    }
    
    func randomX() -> CGFloat {
        CGFloat.random(in: 0...UIScreen.main.bounds.width - 50)
    }
    
    func randomY() -> CGFloat {
        CGFloat.random(in: 0...UIScreen.main.bounds.height - 400)
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
*/
import SwiftUI

struct gameOneView: View {
    @State private var showSpot = false
    @State private var score = 0
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            VStack {
                Text("Score: \(score)")
                    .font(.largeTitle)
                
                Spacer()
            }
            
            ZStack {
                Color.white
                if showSpot {
                    SpotView(x: randomX(), y: randomY())
                        .onTapGesture {
                            self.score += 1
                            self.showSpot = false
                        }
                }
            }
            .frame(width: 100, height: 100)
            .padding(.bottom, 50)
        }
        .onAppear(perform: startGame)
    }
    
    func startGame() {
        var counter = 0
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            self.showSpot.toggle()
            counter += 1
            if counter % 5 == 0 {
                timer.invalidate()
                let newTimeInterval = timer.timeInterval * 0.9 // reduce the time interval by 10%
                self.timer = Timer.scheduledTimer(withTimeInterval: newTimeInterval, repeats: true) { timer in
                    self.showSpot.toggle()
                }
            }
        }
    }
    
    func randomX() -> CGFloat {
        CGFloat.random(in: 0...UIScreen.main.bounds.width - 50)
    }
    
    func randomY() -> CGFloat {
        CGFloat.random(in: 0...UIScreen.main.bounds.height - 400)
    }
}

struct SpotView: View {
    let image = Image("hamstersmall")
    let x: CGFloat
    let y: CGFloat
    
    var body: some View {
        image
            .resizable()
            .frame(width: 50, height: 50)
            .position(x: x, y: y)
    }
}

struct gameOneView_Previews: PreviewProvider {
    static var previews: some View {
        gameOneView()
    }
}
