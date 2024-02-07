//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Anousheh Hasan on 07/02/2024.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    // Get information from ContentView for the arrays of existing habits, so that we can add to them
    var habitsInstance: Habits
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Add Habit") {
                    TextField("", text: $name)
                }
                
                Section("Habit Description (Optional)"){
                    TextEditor(text: $description)
                }
            }
            .navigationTitle("Add Habit")
            .toolbar {
                Button("Save") {
                    let habit = Habit(name: name, description: description)
                    habitsInstance.habits.append(habit)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddHabitView(habitsInstance: Habits())
}
