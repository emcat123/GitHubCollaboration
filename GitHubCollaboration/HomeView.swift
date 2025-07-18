//
//  HomeView.swift
//  GitHubCollaboration
//
//  Created by Scholar on 7/18/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 255/255, green: 245/255, blue: 225/255)
                    .ignoresSafeArea()
                Text("Welcome to Agenda!")
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .multilineTextAlignment(.center)
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
