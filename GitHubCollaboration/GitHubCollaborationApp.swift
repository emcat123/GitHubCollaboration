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
                ToDoListView()
                    .tabItem { Label("To Do", systemImage: "checklist") }
                    .modelContainer(for: ToDoItem.self)

                CountdownTimer()
                    .tabItem { Label("Timer", systemImage: "timer") }

                CalendarSwiftUIView()
                    .tabItem { Label("Calendar", systemImage: "calendar") }
            }
        }
    }
}
