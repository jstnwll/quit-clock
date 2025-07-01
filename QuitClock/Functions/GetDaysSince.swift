//
//  GetDaysSince.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/26/25.
//

import Foundation

// Return integer of days between date given and the current date.

func getDaysSince(date: Date) -> Int {
    let daysSince: Int =
        Calendar.current.dateComponents([.day], from: date, to: Date())
        .day ?? 0
    return daysSince
}
