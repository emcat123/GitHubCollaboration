//
//  ToDoListView.swift
//  GitHubCollaboration
//
//  Created by Emi Carlstrom on 7/16/25.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 160/255, green: 135/255, blue: 159/255))  // Less dark shade
                Spacer()
                Button {
                    withAnimation {
                        showNewTask = true
                    }
                } label: {
                    Image(systemName: "plus")
                }
            }
            .padding()
            
            Spacer()
            
            List {
                ForEach(toDos) { toDoItem in
                    if toDoItem.isImportant {
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                }
                .onDelete(perform: deleteToDo)
            }
            .padding(12)
            .listStyle(.plain)
            
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
            }
        }
        .padding()
        .background(
            Color(red: 245/255, green: 208/255, blue: 244/255)
                .ignoresSafeArea()
        )
    }
    
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ToDoListView()
}
