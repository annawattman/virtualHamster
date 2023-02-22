//
//  SleepTimerView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-02-16.
//

import SwiftUI
struct SleepTimeView: View {
    
    @State var remainingTime = 30
    @State var timer: Timer?
    @State var isTimeUp = false
    @State var showPoints = false
    @State var navigateBack = false
    @EnvironmentObject var vm : ViewModel
    @State private var score = 0
    @Environment(\.presentationMode) var presentation
  //  @State var points: Int
    
    
    var body: some View {
        NavigationView {
            VStack {
                if !showPoints {
                    Image("hamstersleeping")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .centerH()
                    
                }
                
                if !isTimeUp {
                    Text("\(remainingTime) seconds remaining")
                        .padding()
                        .onAppear {
                            startTimer()
                        }
                } else {
                    if !showPoints {
                        Button("Collect Points") {
                            showPoints = true
                          //  points += 10
                        }
                        .buttonStyle(GreenButtonStyle())
                        .padding()
                   
                    } else {
                        Text("+10 points")
                            .font(.title)
                            .foregroundColor(.green)
                            .padding()
                        Button(action: {
                            vm.pet.points += 10
                            self.presentation.wrappedValue.dismiss()
                        }, label: {
                                Text("Go back")
                               
                        })
                        /*
                        NavigationLink(
                            destination: ContentView(),
                            isActive: $navigateBack) {
                            Button("Go Back") {
                                navigateBack = true
                            }*/
                            .buttonStyle(GreenButtonStyle())
                            .padding()
                        
                    }
                }
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                isTimeUp = true
                timer?.invalidate()
            }
        }
    }
}

struct SleepTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SleepTimeView()
    }
}

struct GreenButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
