import SwiftUI

struct ContentView: View {
  var body: some View {
      TabView {
          WelcomeView()
          ForEach(0 ..< Exercise.exercises.count) { index in
              ExerciseView(index: index)
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
