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
                    Button("\(Image(systemName: "xmark"))", role: .cancel) {
                        dismiss()
                    }
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
                    }
                }
            }
        }
    }
    func addHabit() {
        modelContext.insert(
            Habit(habitName: name, habitStartDate: date)
        )
        try? modelContext.save()

    }
}

#Preview {
    AddHabitView()
}
