import SwiftUI

 enum ATImageType {
    case remote(url: String)
    case local(name: String)
    case sfImage(name: String)
}

struct ATImage: View {
    var imageType: ATImageType
    var body: some View {
        loadImage
    }
    
    @ViewBuilder
    private var loadImage: some View {
        switch imageType {
        case .remote(let url):
            remoteImage(url: url)
        case .local(let name):
            localImage(name: name)
        case .sfImage(let name):
            sfImage(name: name)
        }
    }
    
    private func sfImage(name: String) -> some View {
        Image(systemName: name)
    }
    
    private func localImage(name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFill()
    }
    
    private func remoteImage(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                ZStack(alignment:.bottomLeading) {
                    image
                        .resizable()
                        .scaledToFill()
                }
            case .failure(_):
                Color.purple.opacity(0.1)
            case .empty:
                Color.purple.opacity(0.1)
            @unknown default:
                ZStack {
                    Color.white
                    ProgressView()
                }
            }
        }
    }
}

struct ATImage_Previews: PreviewProvider {
    static var previews: some View {
        ATImage(imageType: .remote(url: "https://images.unsplash.com/photo-1583976569415-ec7d52156227?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"))
            .frame(height: 400)
            .padding(.horizontal, 0)
            .clipped()
           
    }
}
