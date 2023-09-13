import SwiftUI

struct TotalButton<Destination: View>: View {
    
    var destination: Destination
    var label: String
    
    init(destination: Destination, label: String) {
        self.destination = destination
        self.label = label
    }
    
    var body: some View {
        NavigationLink(destination: destination.navigationBarBackButtonHidden(true)){
            Text(label)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(18)
                .padding(.horizontal, 12)
        }
        .frame(width: 390, height: 88)
        .background(Color.white)
        .overlay(
            Rectangle()
                .inset(by: -0.5)
                .stroke(Color(red: 0.91, green: 0.91, blue: 0.93), lineWidth: 1)
        )
    }
}

struct TotalButton_Previews: PreviewProvider {
    static var previews: some View {
        TotalButton(destination: Text("Destination View"), label: "Button Label")
    }
}
