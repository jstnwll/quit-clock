//
//  Habit.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/27/25.
//

import Foundation
import SwiftData

@Model
class Habit: Identifiable {
    var id: UUID
    var name: String
    var date: Date

    init(name: String, date: Date = Date()) {
        self.id = UUID()
        self.name = name
        self.date = date
    }
}
