//
//  AddHabit.swift
//  HabitTracker
//
//  Created by FARIT GATIATULLIN on 18.04.2021.
//

import SwiftUI

struct AddHabit: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habits: Habits
    
    @State private var name = ""
    @State private var description = ""
    //@State private var type = "Personal"
    @State private var count = 0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                TextField("Description", text: $description)
                    .frame(height: 100)
                     .textFieldStyle(PlainTextFieldStyle())
                     //.padding([.leading, .trailing], 4)
                     //.cornerRadius(16)
                     //.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                     //.padding([.leading, .trailing], 24)
                
            }
            .navigationBarTitle("Add new habit")
            .navigationBarItems(trailing: Button("Save") {
                let habit = HabitItem(name: self.name, description: self.description, completedCount: 0)
                self.habits.items.append(habit)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
