//
//  Helpers.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-01-26.
//

import Foundation
import SwiftUI


//Helper functions
func calculateTimeSince(data: Date) -> Int {
    let seconds = Int(-data.timeIntervalSinceNow)
    return seconds
}

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
