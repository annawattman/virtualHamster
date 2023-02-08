//
//  Content-ViewModel.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-26.
//
/*
import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var pet : Pet
        private var repository = petRepository()
        
        init() {
            pet = repository.loadData()
        }
        
        func saveData() {
            objectWillChange.send()
            repository.saveData(pet: pet)
        }
        
        func feed() {
            pet.lastMeal = Date()
            saveData()
        }
        
        func giveWater() {
            pet.lastDrink = Date()
            saveData()
        }
        
        func playTime() {
            pet.lastPlayed = Date()
            saveData()
        }
        
        func walkTime() {
            pet.lastWalk = Date()
            saveData()
        }
        
        func showerTime() {
            pet.lastShower = Date()
            saveData()
        }
        
    }
}
*/
import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var pet : Pet
        @Published var actions = ["Feed", "Give water", "Play", "Shower"]
        private var repository = petRepository()
        
        init() {
            pet = repository.loadData()
        }
        
        func saveData() {
            objectWillChange.send()
            repository.saveData(pet: pet)
        }
        
        func feed() {
            pet.lastMeal = Date()
            saveData()
        }
        
        func giveWater() {
            pet.lastDrink = Date()
            saveData()
        }
        
        func playTime() {
            pet.lastPlayed = Date()
            saveData()
        }
        
        func showerTime() {
            pet.lastShower = Date()
            saveData()
        }
        
    }
}

