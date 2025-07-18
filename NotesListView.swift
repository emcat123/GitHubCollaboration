//
//  NotesListView.swift
//  GitHubCollaboration
//
//  Created by Scholar on 7/17/25.
//

import SwiftUI

// Custom ButtonStyle: shows rounded background only while pressed
struct RoundedPressButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(configuration.isPressed ? Color.white.opacity(0.7) : Color.clear)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // subtle press scale effect
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

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
                            .foregroundColor(Color(red: 101/255, green: 132/255, blue: 108/255))

                        Spacer()

                        Button(action: addNote) {
                            Image(systemName: "plus")
                                .font(.title2)
                        }
                        .buttonStyle(RoundedPressButtonStyle()) // Apply the custom press style
                    }
                    .padding()

                    List {
                        ForEach($notes) { $note in
                            NavigationLink(destination: NoteDetailView(note: $note)) {
                                Text(note.title)
                            }
                        }
                        .onDelete(perform: deleteNote)
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
        notes.remove(atOffsets: offsets)
    }
}

#Preview {
    NotesListView()
}
