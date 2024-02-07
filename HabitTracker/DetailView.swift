//
//  DetailView.swift
//  HabitTracker
//
//  Created by Anousheh Hasan on 07/02/2024.
//
// View which shows the description of the associated habit

import SwiftUI

struct DetailView: View {
    var description: String
    var habitsInstance: Habits
    
    var body: some View {
        VStack {
            Text(description)
        }
    }
}

#Preview {
    DetailView(description: "Description Placeholder", habitsInstance: Habits())
}
