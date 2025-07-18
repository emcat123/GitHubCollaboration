//
//  NoteDetailView.swift
//  GitHubCollaboration
//
//  Created by Scholar on 7/17/25.
//

import SwiftUI

struct NoteDetailView: View {
    @Binding var note: Note // <-- ✅ Binding is the correct way

    var body: some View {
        VStack {
            TextField("Title", text: $note.title)
                .font(.title)
                .padding()
            
            TextEditor(text: $note.content)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Edit Note")
    }
}

#Preview {
    StatefulPreviewWrapper(Note(title: "Sample Note", content: "Preview content")) { binding in
        NoteDetailView(note: binding)
    }
}

