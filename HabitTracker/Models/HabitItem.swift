//
//  Habit.swift
//  HabitTracker
//
//  Created by FARIT GATIATULLIN on 18.04.2021.
//

import Foundation

struct HabitItem : Identifiable, Codable {
    var id = UUID()
    var name: String = "TestName"
    var description: String = "TestDesc"
    //let type: String
    var completedCount: Int = 0
    
    static func == (lhs: HabitItem, rhs: HabitItem) -> Bool {
          return lhs.id == rhs.id
      }
}
