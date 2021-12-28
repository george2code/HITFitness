import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
  var body: some View {
      TabView(selection: $selectedTab) {
          WelcomeView(selectedTab: $selectedTab)
              .tag(9)
          ForEach(0 ..< Exercise.exercises.count) { index in
              ExerciseView(selectedTab: $selectedTab, index: index).tag(index)
          }
          
          Text("Exercise 2")
      }
      .tabViewStyle(.page)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
