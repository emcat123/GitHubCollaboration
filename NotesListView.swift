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
            ZStack {
                // Background color that fills the whole screen
                Color(red: 169/255, green: 220/255, blue: 180/255)
                    .ignoresSafeArea()

                VStack {
                    // Custom header with title and plus button
                    HStack {
                        Text("Notes")
                            .font(.system(size: 40))
                            .fontWeight(.black)

                        Spacer()

                        Button(action: addNote) {
                            Image(systemName: "plus")
                                .font(.title2)
                        }
                    }
                    .padding()

                    List {
                        ForEach($notes) { $note in
                            NavigationLink(destination: NoteDetailView(note: $note)) {
                                Text(note.title)
                            }
                        }
                        .onDelete(perform: deleteNote) // ✅ Add this to enable swipe-to-delete
                    }
                    .listStyle(.plain)
                    .background(Color.clear)
                }
            }
            .navigationBarHidden(true) // Hide default nav bar
        }
    }

    func addNote() {
        let newNote = Note(title: "New Note", content: "")
        notes.append(newNote)
    }

    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets) // ✅ Removes the selected note(s)
    }
}

#Preview {
    NotesListView()
}
