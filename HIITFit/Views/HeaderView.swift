import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int //1
    let titleText: String
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
//                Image(systemName: "hand.wave")
                ForEach(0 ..< Exercise.exercises.count) { index in
                    let fill = index  == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(fill)")
                        .onTapGesture {
                            selectedTab = index
                        }
                }
//                Image(systemName: "1.circle")
//                Image(systemName: "2.circle")
//                Image(systemName: "3.circle")
//                Image(systemName: "4.circle")
            }
            .font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(selectedTab: .constant(0), titleText: "Squat")
                .previewLayout(.sizeThatFits)
            HeaderView(selectedTab: .constant(1), titleText: "Squat")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
