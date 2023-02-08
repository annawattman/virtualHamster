//
//  ContentView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-23.
//
/*
import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 15, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        Form {
            Section("Hamster") {
                TextField("Name your hamster: ", text: $vm.pet.name)
                Image(vm.pet.happinessLevel == "Happy" ? "hamsterhappy" : "hamstersad") // Lägg till sovande hamster
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .centerH()
                Text("Age: **\(vm.pet.age)**")
                Text("Status: **\(vm.pet.happinessLevel)**")
                Text("Hunger: **\(vm.pet.hunger)**")
                Text("Thirst: **\(vm.pet.thirst)**")
                Text("Bored: **\(vm.pet.playTime)**")
                Text("Needs to pee: **\(vm.pet.walkTime)**")
                Text("Smelly: **\(vm.pet.showerTime)**")
            }
            Section("Actions") {
                Button("Feed", action: vm.feed)
                Button("Give water", action: vm.giveWater)
                Button("Play", action: vm.playTime)
                Button("Walk", action: vm.walkTime)
                Button("Shower", action: vm.showerTime)
            }
        }
        .onReceive(timer) {_ in
            vm.saveData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
/*
import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 15, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        Form {
            Section("Hamster") {
                TextField("Name your hamster: ", text: $vm.pet.name)
                Image(vm.pet.happinessLevel == "Happy" ? "hamsterhappy" : "hamstersad") // Lägg till sovande hamster
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .centerH()
          /*      Text("Age: **\(vm.pet.age)**")
                Text("Status: **\(vm.pet.happinessLevel)**")
                Text("Hunger: **\(vm.pet.hunger)**")
                Text("Thirst: **\(vm.pet.thirst)**")
                Text("Bored: **\(vm.pet.playTime)**")
                Text("Needs to pee: **\(vm.pet.walkTime)**")
                Text("Smelly: **\(vm.pet.showerTime)**") */
            }
            Section("Actions") {
                HStack {
                    Button("Feed", action: vm.feed)
                    Button("Give water", action: vm.giveWater)
                    Button("Play", action: vm.playTime)
                }
                HStack {
                    Button("Walk", action: vm.walkTime)
                    Button("Shower", action: vm.showerTime)
                }
            }
        }
        .onReceive(timer) {_ in
            vm.saveData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} */

import SwiftUI
import Swift

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 15, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        VStack {
            Section("Hamster") {
                TextField("Name your hamster: ", text: $vm.pet.name)
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
                        Button(vm.actions[2]) {
                            self.vm.playTime()
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 70, height: 50)
                        .padding()
                        .background(self.vm.pet.isActionNeeded(for: vm.actions[2]) ? Color.red : Color.green)
                        .padding([.trailing], 10)
                        
                        Button(vm.actions[3]) {
                            self.vm.showerTime()
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 70, height: 50)
                        .padding()
                        .background(self.vm.pet.isActionNeeded(for: vm.actions[3]) ? Color.red : Color.green)
                        .padding([.trailing], 10)
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
}
