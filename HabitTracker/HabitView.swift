//
//  HabitView.swift
//  HabitTracker
//
//  Created by FARIT GATIATULLIN on 18.04.2021.
//

import SwiftUI

struct HabitView: View {
    @State var editModeToggled = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var habit: HabitItem
    @ObservedObject var habits: Habits
    @State private var completedCount = 0
    @State private var name = ""
    @State private var description = ""
   
    var body: some View {
        VStack {
            if !editModeToggled {
                HStack {
                    Text(self.habit.description)
                    Spacer()
                }
            } else {
                
                    TextField("Name", text: $name)
                        .border(Color(UIColor.separator))
                    TextField("Description", text: $description)
                        .border(Color(UIColor.separator))
                
                
            }
            
            Divider()
            Stepper(value: $completedCount, in: 0...Int.max, step: 1) {
                                Text("Completed times: \(self.completedCount)")
                            }
//            Button("+1") {
//                completedCount += 1
//            }
            if !editModeToggled {
            Button("Edit Habbit") {
                editModeToggled.toggle()
            }
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text("\(self.habit.name)"))
                .navigationBarItems(trailing: Button(action: {
                    saveHabit()
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                }))
                    .onAppear {
                        self.completedCount = self.habit.completedCount
                        self.name = self.habit.name
                        self.description = self.habit.description
                }
        .onDisappear {
            saveHabit()
        }
    }
    
    func saveHabit() {
            if let indexItem = self.habits.items.firstIndex(where: { (item) -> Bool in
                item == self.habit
            }) {
                let tempHabit = HabitItem(name: self.name, description: self.description, completedCount: self.completedCount)
                

                
                self.habits.items.remove(at: indexItem)
                self.habits.items.insert(tempHabit, at: indexItem)
                
                self.habits.saveHabits()
            }
        }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
//        PreviewWrapper()
        HabitView(habit: HabitItem(name: "Name", description: "Description", completedCount: 0), habits: Habits())
    }
}


//struct PreviewWrapper: View {
//  @State var code: HabitItem = HabitItem(name: "Test", description: "Test", count: 1)
//
//  var body: some View {
//    HabitView(habit: $code)
//  }
//}

