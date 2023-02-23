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
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var vm : ViewModel
    let timerInterval = 2.0
    let image = Image("hamstersmall")
   @State var timer: Timer?
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Button("Go Back") {
                        print("Button tapped")
                        print("point before: \(vm.pet.points)")
                        vm.pet.points += score
                        print("point after: \(vm.pet.points)")
                        self.presentation.wrappedValue.dismiss()
                        
                    }
                    .font(.system(size: 16))
                    .padding(8)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    
                    Text("Score: \(score)")
                        .font(.largeTitle)
                    
                    Spacer()
                }
                
                ZStack {
                    Color.white
                    if showSpot {
                        Image("hamstersmall")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .position(x: randomX(), y: randomY())
                            .onTapGesture {
                                score += 1
                                self.showSpot = false
                            }
                    }
                }
                .frame(width: 100, height: 100)
                .padding(.bottom, 50)
                .centerH()
            }
            
            .onAppear(perform: startGame)
            
        }
        .navigationBarBackButtonHidden(true) // hides the default back button
    }
    
    func startGame() {
        var counter = 0
         timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            self.showSpot.toggle()
            counter += 1
            if counter % 5 == 0 {
                timer.invalidate()
                let newTimeInterval = timer.timeInterval * 0.9 // reduce the time interval by 10%
                self.timer = Timer.scheduledTimer(withTimeInterval: newTimeInterval, repeats: true) { timer in
                    self.showSpot.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.showSpot = false
            }
        }
        // set showSpot to false when game starts
        self.showSpot = false
    }

    
    func randomX() -> CGFloat {
        CGFloat.random(in: 150...(UIScreen.main.bounds.width - 200))
    }
    
    func randomY() -> CGFloat {
        CGFloat.random(in: 300...(UIScreen.main.bounds.height - 250))
    }
}

struct gameOneView_Previews: PreviewProvider {
    static var previews: some View {
        gameOneView()
    }
}



/*
import SwiftUI

struct gameOneView: View {
    @State private var showSpot = false
    
    @State private var timer: Timer?
    @EnvironmentObject var vm : ViewModel
    @State private var score = 0
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            ZStack {
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
                    
                    
                    Text("Score: \(score)")
                        .font(.largeTitle)
                    
                    Spacer()
                }
                
                ZStack {
                    Color.white
                    if showSpot {
                        SpotView(x: randomX(), y: randomY())
                            .onTapGesture {
                                score += 1
                                self.showSpot = false
                            }
                    }
                }
                .frame(width: 100, height: 100)
                .padding(.bottom, 50)
                .centerH()
            }
            
            .onAppear(perform: startGame)
        }
        .navigationBarBackButtonHidden(true) // hides the default back button
        
    }
    
    func startGame() {
        var counter = 0
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
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
        // set showSpot to false when game starts
        self.showSpot = false
    }
    
    func randomX() -> CGFloat {
        CGFloat.random(in: 150...(UIScreen.main.bounds.width - 200))
    }
    
    func randomY() -> CGFloat {
        CGFloat.random(in: 300...(UIScreen.main.bounds.height - 250))
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
*/
