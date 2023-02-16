//
//  petRepository.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-30.
//

import Foundation

//Ladda och spara information
class petRepository {
    private var PET_KEY = "PET_KEY"
    private var pet: Pet
   

    
    init() {
        //Kollar om det finns data
        if let data = UserDefaults.standard.data(forKey: PET_KEY) {
            if let decoded = try? JSONDecoder().decode(Pet.self, from: data) {
                self.pet = decoded
                print("Pet data successfully retrieved")
                return
            }
        }
        self.pet = Pet(name: "Tommy", birthday: Date(), lastMeal: Date(), lastDrink: Date(), lastPlayed: Date(), lastSlept: Date())
    }
    
    func loadData() -> Pet {
        return self.pet
    }
    
    
    //Koppla till databasen
    func saveData(pet: Pet) {
        if let encoded = try? JSONEncoder().encode(pet) {
            UserDefaults.standard.set(encoded, forKey: PET_KEY)
            
            print("Data saved at: \(Date().formatted(date: .omitted, time: .standard))")
        }
    }
}
