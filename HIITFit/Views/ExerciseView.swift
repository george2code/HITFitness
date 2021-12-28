import SwiftUI
import AVKit
import Foundation

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State private var rating = 0
    @State private var showHistory = false
    @State private var showSuccess = false
    let index: Int
    let interval: TimeInterval = 30
    
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab,
                           titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
                
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(width: geometry.size.width, height: geometry.size.height*0.45, alignment: .center)
                } else {
                    Text("Couldn't find \(Exercise.exercises[index].videoName).mp4").foregroundColor(.red)
                }
                
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: 90))
                
                HStack(spacing: 150) {
                  Button("Start Exercise") { }
                    
                  Button("Done") {
                      if lastExercise {
                          showSuccess.toggle()
                      } else {
                          selectedTab += 1
                      }
                  }
                  .sheet(isPresented: $showSuccess) {
                      SuccessView(selectedTab: $selectedTab)
                  }
                }
                .font(.title3)
                .padding()
                
                RatingView(rating: $rating)
                    .padding()
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                .padding(.bottom)
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(3), index: 3)
    }
}
