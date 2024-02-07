//
//  DetailView.swift
//  HabitTracker
//
//  Created by Anousheh Hasan on 07/02/2024.
//
// View which shows the description of the associated habit

import SwiftUI

struct DetailView: View {
    // Variables
    var habitsInstance: Habits
    var description: String
    var name: String
    
    var body: some View {
        NavigationStack {
            Spacer()
            Group {
                if description == "" {
                    Text("No Description")
                        .foregroundStyle(.secondary)
                } else {
                    Text(description)
                }
            }
                .padding(20)
                .multilineTextAlignment(.center)
                .navigationTitle(name)
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    let placeholderDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    
    return DetailView(habitsInstance: Habits(), description: placeholderDescription, name: "Habit Name")
}
