//
//  FormatDate.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/24/25.
//

import Foundation

// Return string of date in June, 2, 2025 format.

func formatDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter.string(from: date)
}
