//
//  Habit.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/23/25.
//

import Foundation
import SwiftData

@Model
class Habit: Identifiable {
    var id: String = UUID().uuidString
    var habitName: String
    var startDate: Date = Date()
    var isHidden: Bool = false

    init(
        id: String,
        habitName: String,
        startDate: Date,
        isHidden: Bool
    ) {
        self.id = id
        self.habitName = habitName
        self.startDate = startDate
        self.isHidden = isHidden
    }
}
