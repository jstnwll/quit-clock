//
//  GetDaysSinceStart.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/26/25.
//

import Foundation

func getDaysSinceStart(startDate: Date) -> Int {
    let daysSinceStart: Int =
        Calendar.current.dateComponents([.day], from: startDate, to: Date())
        .day ?? 0
    return daysSinceStart
}
