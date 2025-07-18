//
//  NewToDoView.swift
//  GitHubCollaboration
//
//  Created by Emi Carlstrom on 7/16/25.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    @Binding var showNewTask: Bool
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Task:")
                        
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
              .padding(12)
              .background(Color(.systemGroupedBackground))
                        
            Toggle("Is it Important?", isOn: $toDoItem.isImportant)

            HStack {
                Spacer()

                Button {
                    addToDo()
                    showNewTask = false
                } label: {
                    Text("Add Task")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
        }
        .padding(20)
    }
    
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        
        modelContext.insert(toDo)
    }
}

#Preview {
    NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false))
}
