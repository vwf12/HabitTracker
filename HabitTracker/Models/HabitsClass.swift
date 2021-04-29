//
//  HabitsClass.swift
//  HabitTracker
//
//  Created by FARIT GATIATULLIN on 18.04.2021.
//

import Foundation

class Habits: ObservableObject {
    @Published var items: [HabitItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let habits = UserDefaults.standard.data(forKey: "Habits") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([HabitItem].self, from: habits) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
    
    func saveHabits() {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
}
