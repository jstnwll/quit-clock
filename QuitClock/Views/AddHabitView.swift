//
//  AddHabitView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/23/25.
//

import SwiftUI

struct AddHabitView: View {
    var body: some View {
        VStack {
            Text("Add a new habit!")
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "checkmark")
            }
        }
    }
}

#Preview {
    AddHabitView()
}
