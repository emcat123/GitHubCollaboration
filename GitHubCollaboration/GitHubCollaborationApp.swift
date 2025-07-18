//
//  GitHubCollaborationApp.swift
//  GitHubCollaboration
//
//  Created by Emi Carlstrom on 7/15/25.
//

import SwiftUI
import SwiftData

@main
struct GitHubCollaborationApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                ToDoListView()
                    .tabItem {
                        Label("To-Do List", systemImage: "checklist")
                    }
                    .modelContainer(for: ToDoItem.self)

                CountdownTimer()
                    .tabItem {
                        Label("Countdown", systemImage: "timer")
                    }

                CalendarSwiftUIView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                
                NotesListView()
                    .tabItem {
                        Label("Notes", systemImage: "note.text")
                    }
            }
        }
    }
}
