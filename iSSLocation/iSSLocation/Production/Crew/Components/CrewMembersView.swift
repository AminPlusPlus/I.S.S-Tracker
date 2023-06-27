import SwiftUI
import FirebaseFirestoreSwift

struct CrewMembersView: View {
    @FirestoreQuery(collectionPath: "Crews") var listAdventuresResult: Result<[AstroCrew], Error>
    
    var body: some View {
        NavigationView {
            crewMemberContainerView
                .padding(.horizontal)
                .navigationTitle("Crews 👨‍🚀")
        }
    }
    
    @ViewBuilder
    var crewMemberContainerView: some View {
        switch listAdventuresResult {
        case .success(let crews):
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(crews, id: \.self) { crew in
                        crew
                        Divider()
                         
                    }
                }
                .padding(.horizontal, 10)
                
            }
        case .failure(let failure):
            let  _ = print(failure)
        }
    }
}

struct CrewMembersView_Previews: PreviewProvider {
    static var previews: some View {
        CrewMembersView()
    }
}
