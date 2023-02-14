//
//  ContentView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-23.
//

import SwiftUI
import Swift

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 15, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Section() {
                    //TextField("Name your hamster: ", text: $vm.pet.name)
                    // .centerH()
                    Text("Virtual hamster")
                        .fontWeight(.bold)
                        .font(.system(.title, design: .rounded))
                        .padding(10)
                    Text("Name:")
                    TextField("", text: $vm.pet.name)
                        .background(Color.white)
                        .cornerRadius(2)
                        .padding(.all, 4)
                        .border(Color.black)
                        .frame(width: 70, height: 30)
                        .centerH()
                    Text("Age: **\(vm.pet.age)**")
                    Image(vm.pet.happinessLevel.0 == "Happy" ? "hamsterhappy" : "hamstersad")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .centerH()
                }
                
                Section("Actions") {
                    VStack(spacing: 20) {
                        
                        HStack {
                            Button(vm.actions[0]) {
                                self.vm.feed()
                            }
                            .foregroundColor(Color.white)
                            .frame(width: 70, height: 50)
                            .padding()
                            .background(self.vm.pet.isActionNeeded(for: vm.actions[0]) ? Color.red : Color.green)
                            .padding([.trailing], 10)
                            
                            
                            Button(vm.actions[1]) {
                                self.vm.giveWater()
                            }
                            .foregroundColor(Color.white)
                            .frame(width: 70, height: 50)
                            .padding()
                            .background(self.vm.pet.isActionNeeded(for: vm.actions[1]) ? Color.red : Color.green)
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
                            
                            
                            Button(vm.actions[3]) {
                                self.vm.sleepTime()
                            }
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

