//
//  ContentView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()  // skapar en instans av ViewModel och tilldelar den till vm
    private let timer = Timer.publish(every: 15, on: .main, in: .common)  // skapar en timer som ska köras var 15:e sekund
    
    var body: some View {
        NavigationView {  // skapar en NavigationView
            VStack {  // skapar en vertikal stack
                Section() {  // skapar en section
                    Text("Virtual hamster") // Rubrik
                        .fontWeight(.bold)
                        .font(.system(.title, design: .rounded))
                        .padding(10)
                    Text("Name:") // Namn på hamster
                    TextField("", text: $vm.pet.name)  // Ett textfield där användaren kan mata in en sträng som tilldelas vm.pet.name
                        .background(Color.white)
                        .cornerRadius(2)
                        .padding(.all, 4)
                        .border(Color.black)
                        .frame(width: 70, height: 30)
                        .centerH()
                    Text("Age: **\(vm.pet.age)**")  // en text där hamsterns ålder visas s
                    Image(vm.pet.happinessLevel.0 == "Happy" ? "hamsterhappy" : "hamstersad")  // en image/bild som visar en bild beroende på om hamstern är glad eller ledsen
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .centerH()
                    Text("Points: **\(vm.pet.points)**")  // en text som visar poäng
                }
                
                Section("Actions") {  // skapar en section för de olika actions som finns
                    VStack(spacing: 20) {  // skapar en vertikal stack med mellanrum mellan komponenterna
                        if vm.pet.points < 2 {  // en if-sats som kontrollerar om det finns tillräckligt med poäng för att kunna mata eller ge vatten
                            Text("Not enough points")  // en text som visas om det inte finns tillräckligt med poäng
                                .foregroundColor(.red)
                                .padding(.top, 20)
                        }
                        
                        HStack {  // skapar en horisontell stack
                            Button(vm.actions[0]) {  // en knapp som utför en action när den trycks på
                                self.vm.feed()
                            }
                            .foregroundColor(Color.white)
                            .frame(width: 70, height: 50)
                            .padding()
                            .background(self.vm.pet.points < 3 ? Color.gray : (self.vm.pet.isActionNeeded(for: vm.actions[0]) ? Color.red : Color.green))
                            .disabled(self.vm.pet.points < 3)  // gör knappen inaktiverad om hamstern inte har tillräckligt med poäng
                            
                            
                            
                            Button(vm.actions[1]) {
                                self.vm.giveWater()
                            }
                            .foregroundColor(Color.white)
                            .frame(width: 70, height: 50)
                            .padding()
                            .background(self.vm.pet.points < 3 ? Color.gray : (self.vm.pet.isActionNeeded(for: vm.actions[1]) ? Color.red : Color.green))
                            .disabled(self.vm.pet.points < 3)
                            .padding([.trailing], 10)
                        }
                        
                        HStack {
                            Button(action: { self.vm.playTime()
                            }, label: {
                                NavigationLink(destination: playTimeView()) {
                                    Text(vm.actions[2])
                                }
                            })
                            .foregroundColor(Color.white)
                            .frame(width: 70, height: 50)
                            .padding()
                            .background(self.vm.pet.isActionNeeded(for: vm.actions[2]) ? Color.red : Color.green)
                            .padding([.trailing], 10)
                            
                            
                            Button(action: { self.vm.sleepTime()
                            }, label: {
                                NavigationLink(destination: SleepTimeView()) {
                                    Text(vm.actions[3])
                                }
                            })
                            .foregroundColor(Color.white)
                            .frame(width: 70, height: 50)
                            .padding()
                            .background(self.vm.pet.isActionNeeded(for: vm.actions[3]) ? Color.red : Color.green)
                            .padding([.trailing], 10)
                            
                        }
                    }
                }
            }
        }
        .environmentObject(vm)
        .onReceive(timer) { _ in
            self.vm.saveData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



