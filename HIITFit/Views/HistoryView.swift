import SwiftUI

struct HistoryView: View {
    var body: some View {
        let history = HistoryStore()
        
        ZStack(alignment: .topTrailing) {
            Button(action: {}) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding(.trailing)
            
            VStack {
                Text(NSLocalizedString("History", comment: "view user activity"))
                    .font(.title)
                .padding()
                
                /// Format a date using the specified format.
                ///   - parameters:
                ///     - format: A date pattern string like "MM dd".
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section(
                            header:
                                Text(day.date.formatted(as: "MMM d"))
                                .font(.headline)) {
                            //Section content
                            ForEach(day.exercises, id: \.self) { exercise in
                                Text(exercise)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
