import SwiftUI
import FirebaseFirestoreSwift

struct AstroCrew: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let fullname: String
    let country: String
    let description: String
    let image: String
}

extension AstroCrew: View {
    var body: some View {
        AstroCrewView(crew: self)
    }
}

private struct AstroCrewView: View {
    let crew: AstroCrew
    var body: some View {
        HStack(spacing: 5) {
            Text(crew.fullname)
                .font(.system(.title2))
                .fontWeight(.bold)
            Spacer()
            Text(crew.country)
                .font(.system(.title2))
                .fontWeight(.bold)
            
        }
    }
}

struct AstroCrewView_Previews: PreviewProvider {
    private static var crew = AstroCrew(id: "vmHwGIu8vDQKldOr0b54",
                                        fullname: "Sergey Prokopyev",
                                        country: "🇷🇺",
                                        description: "Sergey Prokopyev: Russian cosmonaut, ISS flight engineer, repaired Soyuz spacecraft leak.",
                                        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Sergey_Prokopyev_-_NASA_portrait.jpg/400px-Sergey_Prokopyev_-_NASA_portrait.jpg")
    static var previews: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 5) {
                AstroCrewView(crew: crew)
                Divider()
                    .padding(.horizontal)
                AstroCrewView(crew: crew)
            }
            
        }
        
    }
}
