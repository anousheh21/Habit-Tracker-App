//
//  ContentView.swift
//  HabitTracker
//
//  Created by Anousheh Hasan on 06/02/2024.
//

import SwiftUI

// Struct defining structure of a single habit
struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let description: String
}

// Class which holds an array of habits
@Observable
class Habits {
    var habits = [Habit]()
    
    init(habits: [Habit] = [Habit]()) {
        self.habits = habits
    }
}

struct ContentView: View {
    // Variables
    @State private var habitsInstance = Habits()
    
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationStack {
            
            // Shows text if there are no habits to display
            if habitsInstance.habits == [] {
                VStack {
                    Spacer()
                    Text("Press + to Add a New Habit")
                        .foregroundStyle(.secondary)
                }
                    
            }
            
            List {
                // ForEach Loop to show all habits in the habits array
                ForEach(habitsInstance.habits) { habit in
                    NavigationLink {
                        DetailView(description: habit.description, habitsInstance: Habits())
                    } label: {
                        Text(habit.name)
                    }
                    // Text(habit.name)
                }
                .onDelete(perform: removeHabit)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                // Button to present AddHabitview
                Button("Add Habit", systemImage: "plus") {
                    showingAddHabit = true
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habitsInstance: habitsInstance)
            }
        }
    }
    
    // FUNCTIONS
    // Function to remove a habit
    func removeHabit(at offsets: IndexSet) {
        habitsInstance.habits.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
