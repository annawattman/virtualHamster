//
//  petModel.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-26.
//

import Foundation

struct Pet: Codable {
    var name: String // Namnet
    var birthday = Date() // När den är skapad
    var lastMeal = Date() // När den senast åt
    var lastDrink = Date() // När den senast drack
    
    var lastPlayed = Date() // När den senast lekte
    var lastWalk = Date() // När den senast gick promenad
    var lastShower = Date() // När den senast duschade
    
    //Får åldern i sekunder
    var age: Int {
        let timeSince = calculateTimeSince(data: birthday)
        return timeSince
    }
    
    var happinessLevel: String {
        hunger == "hungry" || thirst == "thirsty" || playTime == "playTime" || walkTime == "walkTime" || showerTime == "showerTime" ? "Unhappy" : "Happy"
    }
    
    
    var hunger: String {
        let timeSince = calculateTimeSince(data: lastMeal)
        var string = "hungry"
        // Add hungry functionality
        return string
    }
    
    var thirst: String {
        let timeSince = calculateTimeSince(data: lastDrink)
        var string = "thirsty"
        // Add thirst functionality
        return string
    }
    
    var playTime: String {
        let timeSince = calculateTimeSince(data: lastPlayed)
        var string = "playTime"
        // Add play functionality
        return string
    }
    
    var walkTime: String {
        let timeSince = calculateTimeSince(data: lastWalk)
        var string = "walkTime"
        // Add walkie functionality
        return string
    }
    
    var showerTime: String {
        let timeSince = calculateTimeSince(data: lastShower)
        var string  = "showerTime"
        return string
    }
    
}
