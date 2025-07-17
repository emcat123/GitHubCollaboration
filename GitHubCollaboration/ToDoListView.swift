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
        VStack{
            HStack{
                Text("To Do List")
                 .font(.system(size: 40))
                 .fontWeight(.black)
                
                Spacer()
                
                Button {
                    withAnimation {
                        showNewTask = true
                    }
                } label: {
                    Image(systemName: "plus")
                }
            }.padding()
            
            Spacer()
            
            List {
                ForEach (toDos) { toDoItem in
                    if toDoItem.isImportant {
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                }.onDelete(perform: deleteToDo)
            }
            .padding(12)
            .listStyle(.plain)
            
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
            }            
        }.padding()
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
