//
//  ContentView.swift
//  HabitTracker
//
//  Created by Anousheh Hasan on 06/02/2024.
//

import SwiftUI

struct Habit: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
}

@Observable
class Habits {
    var habits = [Habit]()
    
    init(habits: [Habit] = [Habit]()) {
        self.habits = habits
    }
}

struct ContentView: View {
    @State private var habitsInstance = Habits()
    
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habitsInstance.habits) { habit in
                    Text(habit.name)
                }
                .onDelete(perform: removeHabit)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
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
    func removeHabit(at offsets: IndexSet) {
        habitsInstance.habits.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
