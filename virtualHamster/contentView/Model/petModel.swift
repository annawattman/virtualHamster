//
//  petModel.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-26.
//

/*
import Foundation
import SwiftUI

struct Pet: Codable {
    var name: String // Namnet
    
    var birthday = Date() // När den är skapad
    var lastMeal = Date() // När den senast åt
    var lastDrink = Date() // När den senast drack
    
    var lastPlayed = Date() // När den senast lekte
    var lastShower = Date() // När den senast duschade
    
    //Får åldern i sekunder
    var age: Int {
        let timeSince = calculateTimeSince(data: birthday)
        return timeSince
    }
    /*
     var happinessLevel : String {
     hunger == "hungry" || thirst == "thirsty" || playTime == "playTime" || showerTime == "showerTime" ? "Unhappy" : "Happy"
     } */
    
    var happinessLevel : (String, UIColor) {
        let hungerString = hunger
        let thirstString = thirst
        let playTimeString = playTime.0
        let showerTimeString = showerTime
        
        var happiness: (String, UIColor)
        if hungerString == "Hungry" || thirstString == "Thirsty" || playTimeString == "PlayTime" || showerTimeString == "ShowerTime" {
            happiness = ("Unhappy", .red)
        } else {
            happiness = ("Happy", .green)
        }
        return happiness
    }
}
    
    
    var hunger: String {
        // Add hungry functionality
        var color: Color {
            let timeSince = calculateTimeSince(data: lastMeal)
            var color: UIColor = .white
            
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
        
        var thirst: String {
            var color: Color {
                let timeSince = calculateTimeSince(data: lastDrink)
                var color: UIColor = .white
                
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
            
            /*        var playTime: String {
             let timeSince = calculateTimeSince(data: lastPlayed)
             var string = "playTime"
             // Add play functionality
             switch timeSince {
             case 0..<30: string = "Satiated"
             case 30..<60: string = "Getting hungry..."
             case 60...: string = "Hungry"
             default: string = "Idk"
             }
             return string
             } */
            
            var playTime: (String, UIColor) {
                let timeSince = calculateTimeSince(data: lastPlayed)
                var string = "playTime"
                var color: UIColor = .white
                
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
            
            var showerTime: String {
                let timeSince = calculateTimeSince(data: lastShower)
                var string  = ""
                
                switch timeSince {
                case 0..<30: string = "Satiated"
                case 30..<60: string = "Getting hungry..."
                case 60...: string = "Hungry"
                default: string = "Idk"
                }
                
                return string
            }
            
            
            func isActionNeeded(for action: String) -> Bool {
                switch action {
                case "Feed":
                    return happinessLevel.0 == "Hungry"
                case "Give water":
                    return happinessLevel.0 == "Thirsty"
                case "Play":
                    return happinessLevel.0 == "Bored"
                case "Walk":
                    return happinessLevel.0 == "Energetic"
                case "Shower":
                    return happinessLevel.0 == "Dirty"
                default:
                    return false
                }
            }
        }
    }
}
*/

import Foundation
import SwiftUI

struct Pet: Codable {
    var name: String
    var birthday: Date
    var lastMeal: Date
    var lastDrink: Date
    var lastPlayed: Date
    var lastShower: Date
    
    var age: Int {
        let timeSince = calculateTimeSince(data: birthday)
        return timeSince
    }
    
    var happinessLevel: (String, Color) {
        let hunger = self.hunger
        let thirst = self.thirst
        let playTime = self.playTime
        let showerTime = self.showerTime
        
        if hunger.0 == "Hungry" || thirst.0 == "Thirsty" || playTime.0 == "PlayTime" || showerTime.0 == "ShowerTime" {
            return ("Unhappy", .red)
        } else {
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
    
    var showerTime: (String, Color) {
        let timeSince = calculateTimeSince(data: lastShower)
        var string = ""
        var color: Color = .white
        
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
    
    func isActionNeeded(for action: String) -> Bool {
        switch action {
        case "Feed":
            return happinessLevel.0 == "Hungry"
        case "Give water":
            return happinessLevel.0 == "Thirsty"
        case "Play":
            return happinessLevel.0 == "Bored"
        case "Walk":
            return happinessLevel.0 == "Energetic"
        case "Shower":
            return happinessLevel.0 == "Dirty"
        default:
            return false
        }
    }
}

