import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            
            VStack(spacing: 20.0) {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                .foregroundColor(.purple)
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("""
                  Good job completing all four exercises!
                  Remeber tomorrow's another day.
                  So eat well and get some rest.
                  """)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            
            VStack {
                Spacer()
                Button(action: {}) {
                    Text("Continue")
                }
                .padding()
            }
        }
  
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
