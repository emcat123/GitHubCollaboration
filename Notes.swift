//
//  Notes.swift
//  GitHubCollaboration
//
//  Created by Scholar on 7/17/25.
//

import Foundation

struct Note: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
}
