//
//  NotesListView.swift
//  GitHubCollaboration
//
//  Created by Scholar on 7/17/25.
//

import SwiftUI

struct NotesListView: View {
    @State private var notes: [Note] = []

    var body: some View {
        NavigationView {
            List {
                ForEach($notes) { $note in
                    NavigationLink(destination: NoteDetailView(note: $note)) {
                        Text(note.title)
                    }
                }
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: addNote) {
                Image(systemName: "plus")
            })
        }
    }

    func addNote() {
        let newNote = Note(title: "New Note", content: "")
        notes.append(newNote)
    }
}

#Preview {
    NotesListView()
}

