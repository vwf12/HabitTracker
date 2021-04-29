//
//  ContentView.swift
//  HabitTracker
//
//  Created by FARIT GATIATULLIN on 18.04.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    NavigationLink(destination: HabitView(habit: item, habits: self.habits)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.description)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.caption)
                                    .lineLimit(5)
                            }
                            Spacer()
                            
                            if item.completedCount != 0 {
                                Text("Completed:")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                                    .font(/*@START_MENU_TOKEN@*/.caption2/*@END_MENU_TOKEN@*/)
                                Text("\(item.completedCount)")
                                .font(.title)
                                .fontWeight(.bold)
                                 .foregroundColor(.green)
                            }
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    removeItems(at: indexSet)
                })
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddHabit = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddHabit, content: {
                AddHabit(habits: self.habits)
            })
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
