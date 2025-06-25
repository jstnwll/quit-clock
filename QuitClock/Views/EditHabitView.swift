//
//  EditHabitView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/25/25.
//

import SwiftData
import SwiftUI

struct EditHabitView: View {
    @Bindable var habit: Habit
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {

        NavigationStack {
            VStack {
                TextField("Habit Name", text: $habit.habitName)
                    .onChange(of: habit.habitName) { oldValue, newValue in
                        if newValue.count > 15 {
                            habit.habitName = String("\(newValue.prefix(15))")
                        }
                    }
                DatePicker(
                    "Start Date",
                    selection: $habit.startDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                Spacer()
            }
            .padding()
            .background(.windowBackground)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("", systemImage: "xmark", role: .cancel) {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .title) {
                    Text("Edit Habit")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    // TODO: Change .confirm to .primary if API changes
                    if habit.habitName.isEmpty
                        || habit.habitName.trimmingCharacters(in: .whitespaces)
                            == ""
                        || habit.startDate > Date()
                    {
                        Button("\(Image(systemName: "checkmark"))") {}
                            .disabled(true)
                    } else {
                        Button(
                            "\(Image(systemName: "checkmark"))",
                            role: .confirm
                        ) {
                            habit.habitName = habit.habitName
                            habit.startDate = habit.startDate
                            try? modelContext.save()
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(
                        "\(Image(systemName: "trash"))",
                        role: .destructive
                    ) {
                        habit.isHidden = true
                        try? modelContext.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditHabitView(
        habit: Habit(
            habitName: "Sugar",
            startDate: Date(),
            isHidden: false
        )
    )
}
