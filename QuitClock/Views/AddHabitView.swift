//
//  AddHabitView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/23/25.
//

import SwiftData
import SwiftUI

struct AddHabitView: View {
    @State private var name: String = ""
    @State private var date = Date()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {

        NavigationStack {
            VStack {
                TextField("Habit Name", text: $name)
                    .onChange(of: name) { oldValue, newValue in
                        if newValue.count > 15 {
                            name = String("\(newValue.prefix(15))")
                        }
                    }
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                Spacer()
            }
            .padding()
            .background(.windowBackground)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("\(Image(systemName: "xmark"))") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .title) {
                    Text("New Habit")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("\(Image(systemName: "checkmark"))") {
                        addHabit()
                        name = ""
                        dismiss()
                    }
                    .tint(.accentColor)
                    .disabled(name.isEmpty || name.trimmingCharacters(in: .whitespaces) == "")
                }
            }
        }
    }
    func addHabit() {
        modelContext.insert(
            Habit(habitName: name, startDate: date, isHidden: false)
        )
        try? modelContext.save()

    }
}

#Preview {
    AddHabitView()
}
