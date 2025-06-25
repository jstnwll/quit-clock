//
//  FormatDate.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/24/25.
//

import Foundation

func formatDate(startDate: Date) -> String {
    return
        DateFormatter.localizedString(
            from: startDate,
            dateStyle: .long,
            timeStyle: .none
        )
}
