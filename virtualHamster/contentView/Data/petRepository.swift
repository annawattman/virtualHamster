//
//  petRepository.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-30.
//

import Foundation


/* Jag använder mig av UserDefaults som databas. UserDefaults är en databas som finns tillgänglig på alla Apple-plattformar och används för att spara inställningar och annan enkel data på enheten. Det är en lämplig databas för att lagra små mängder data som inte behöver delas mellan flera enheter eller användare. I detta fall används det för att lagra information om hamstern, såsom dess namn, födelsedag och senaste måltid, spelad tid och sovtid. */
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
        self.pet = Pet(name: "Tommy", birthday: Date(), lastMeal: Date(), lastDrink: Date(), lastPlayed: Date(), lastSlept: Date(), points: 0)
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
