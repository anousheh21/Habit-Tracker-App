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
    @State private var habits = Habits()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.habits) { item in
                    Text(item.name)
                }
            }
            .navigationTitle("Habit Tracker")
        }
    }
}

#Preview {
    ContentView()
}
