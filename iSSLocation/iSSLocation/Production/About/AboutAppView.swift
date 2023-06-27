import SwiftUI

struct AboutAppView: View {
    var body: some View {
        VStack(spacing: 20) {
            ATImage(imageType: .local(name: "AppLogo"))
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text("AstroTrack")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Welcome to AstroTrack, your ultimate companion for tracking the International Space Station (ISS) and exploring the incredible world of astronauts.")
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("Version 1.0.0")
                .font(.headline)
            
            Text("© 2023 AstroTrack")
                .font(.caption)
        }
        .padding()
    }
}

struct AboutAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAppView()
    }
}
