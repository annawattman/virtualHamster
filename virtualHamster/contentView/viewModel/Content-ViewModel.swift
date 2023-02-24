//
//  Content-ViewModel.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-26.
//

import Foundation
import SwiftUI


class ViewModel: ObservableObject {
    @Published var pet : Pet
    @Published var actions = ["Feed", "Give water", "Play", "Sleep"]
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
        pet.points -= 3
        saveData()
    }
    
    func giveWater() {
        pet.lastDrink = Date()
        pet.points -= 2
        saveData()
    }
    
    func playTime() {
        pet.lastPlayed = Date()
        
        saveData()
    }
    
    func sleepTime() {
        
        pet.lastSlept = Date()
        pet.points += 10
        saveData()
        
    }
}


