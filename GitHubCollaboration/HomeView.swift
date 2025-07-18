import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(red: 255/255, green: 245/255, blue: 225/255)
                .ignoresSafeArea()
            Text("Welcome to Agenda!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 155/255, green: 147/255, blue: 135/255))  // Medium darker shade
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    HomeView()
}
