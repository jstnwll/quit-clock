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
                        name = newValue
                    }
                    .accessibilityHint(
                        "Enter the name of the habit."
                    )
                DatePicker(
                    "Quit Date",
                    selection: $date,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .accessibilityHint("Enter the date you quit the habit.")
                Spacer()
            }
            .padding()
            .background(.windowBackground)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("\(Image(systemName: "xmark"))", role: .cancel) {
                        dismiss()
                    }
                    .accessibilityLabel("Cancel adding habit.")
                }
                ToolbarItem(placement: .title) {
                    Text("New Habit")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    // TODO: Change .confirm to .primary if API changes
                    if name.isEmpty
                        || name.trimmingCharacters(in: .whitespaces) == ""
                        || date > Date()
                    {
                        Button("\(Image(systemName: "checkmark"))") {}
                            .disabled(true)
                    } else {
                        Button(
                            "\(Image(systemName: "checkmark"))",
                            role: .confirm
                        ) {
                            addHabit()
                            name = ""
                            dismiss()
                        }
                        .accessibilityLabel("Save new habit.")
                    }
                }
            }
        }
    }
    func addHabit() {
        modelContext.insert(
            Habit(name: name, date: date)
        )
        try? modelContext.save()

    }
}

#Preview {
    AddHabitView()
}
