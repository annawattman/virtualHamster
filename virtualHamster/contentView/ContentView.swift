//
//  ContentView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-23.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()  // skapar en instans av ViewModel och tilldelar den till vm
    private let timer = Timer.publish(every: 15, on: .main, in: .common)  // skapar en timer som ska köras var 15:e sekund på huvudtråden
    
    var body: some View {
        NavigationView {  // skapar en NavigationView
            VStack {  // skapar en vertikal stack
                Section() {  // skapar en section
                    Text("Virtual hamster")  // en Text-komponent som visar en rubrik
                        .fontWeight(.bold)
                        .font(.system(.title, design: .rounded))
                        .padding(10)
                    Text("Name:")  // en Text-komponent som visar en etikett
                    TextField("", text: $vm.pet.name)  // en TextField-komponent där användaren kan mata in en sträng som ska tilldelas vm.pet.name
                        .background(Color.white)
                        .cornerRadius(2)
                        .padding(.all, 4)
                        .border(Color.black)
                        .frame(width: 70, height: 30)
                        .centerH()
                    Text("Age: **\(vm.pet.age)**")  // en Text-komponent som visar åldern på hamstern
                    Image(vm.pet.happinessLevel.0 == "Happy" ? "hamsterhappy" : "hamstersad")  // en Image-komponent som visar en bild beroende på om hamstern är glad eller ledsen
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .centerH()
                    Text("Points: **\(vm.pet.points)**")  // en Text-komponent som visar poängen för hamstern
                }
                
                Section("Actions") {  // skapar en section
                    VStack(spacing: 20) {  // skapar en vertikal stack med mellanrum mellan komponenterna
                        if vm.pet.points < 2 {  // en if-sats som kontrollerar om hamstern har tillräckligt med poäng för att utföra en handling
                            Text("Not enough points")  // en Text-komponent som visar att det inte finns tillräckligt med poäng
                                .foregroundColor(.red)
                                .padding(.top, 20)
                        }
                        
                        HStack {  // skapar en horisontell stack
                            Button(vm.actions[0]) {  // en Button-komponent som utför en handling när den trycks på
                                self.vm.feed()
                            }
                            .foregroundColor(Color.white)
                            .frame(width: 70, height: 50)
                            .padding()
                            .background(self.vm.pet.points < 3 ? Color.gray : (self.vm.pet.isActionNeeded(for: vm.actions[0]) ? Color.red : Color.green))  // sätter bakgrundsfärgen beroende på om handlingen behövs eller inte
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



