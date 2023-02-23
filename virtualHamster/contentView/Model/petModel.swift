//
//  petModel.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-26.
//
import Foundation
import SwiftUI

struct Pet: Codable {
    var name: String
    var birthday: Date
    var lastMeal: Date
    var lastDrink: Date
    var lastPlayed: Date
    var lastSlept: Date
    // lägg till points
    var points: Int
    
    
    var age: Int {
        let timeSince = calculateTimeSince(data: birthday)
        return timeSince
    }
    

    
    var happinessLevel: (String, Color) {
        let hunger = self.hunger
        let thirst = self.thirst
        let playTime = self.playTime
        let sleepTime = self.sleepTime
        
        if hunger.0 == "Hungry" || thirst.0 == "Thirsty" || playTime.0 == "PlayTime" {
            return ("Unhappy", .red)
            
        }
        else {
            return ("Happy", .green)
        }
    }
    
    var hunger: (String, Color) {
        let timeSince = calculateTimeSince(data: lastMeal)
        var string = ""
        var color: Color = .white
        
        switch timeSince {
        case 0..<30:
            string = "Satiated"
            color = .green
        case 30..<60:
            string = "Getting hungry..."
            color = .yellow
        case 60...:
            string = "Hungry"
            color = .red
        default:
            string = "Idk"
            color = .white
        }
        return (string, color)
    }
    
    var thirst: (String, Color) {
        let timeSince = calculateTimeSince(data: lastDrink)
        var string = ""
        var color: Color = .white
        
        switch timeSince {
        case 0..<30:
            string = "Satiated"
            color = .green
        case 30..<60:
            string = "Getting thirsty..."
            color = .yellow
        case 60...:
            string = "Thirsty"
            color = .red
        default:
            string = "Idk"
            color = .white
        }
        return (string, color)
    }
    
    var playTime: (String, Color) {
        let timeSince = calculateTimeSince(data: lastPlayed)
        var string = ""
        var color : Color = .green

        switch timeSince {
        case 0..<30:
            string = "Satiated"
            color = .green
        case 30..<60:
            string = "Getting bored..."
            color = .yellow
        case 60...:
            string = "Bored"
            color = .red
        default:
            string = "Idk"
            color = .white
        }
        return (string, color)
    }


        var sleepTime: (String, Color) {
            let timeSince = calculateTimeSince(data: lastSlept)
            var string = ""
            var color: Color = .white
            
/*
            switch timeSince {
            case 0..<30:
                string = "Wide awake"
                color = .green
            case 30..<60:
                string = "A bit tired"
                color = .yellow
            case 60...:
                string = "Sleepy"
                color = .red
            default:
                string = "Unknown"
                color = .white
            }
*/
            return (string, color)
        }
    
    func isActionNeeded(for action: String) -> Bool {
        switch action {
        case "Feed":
            return happinessLevel.0 == "Hungry"
        case "Give water":
            return happinessLevel.0 == "Thirsty"
        case "Play":
            return happinessLevel.0 == "Bored"
        case "Sleep":
            return happinessLevel.0 == "Sleepy"
        default:
            return false
        }
    }
}
