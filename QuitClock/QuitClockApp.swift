//
//  QuitClockApp.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/19/25.
//

import SwiftData
import SwiftUI

@main
struct QuitClockApp: App {
    var body: some Scene {
        WindowGroup {
            SummaryView()
                .modelContainer(for: Habit.self)
        }
    }
}
