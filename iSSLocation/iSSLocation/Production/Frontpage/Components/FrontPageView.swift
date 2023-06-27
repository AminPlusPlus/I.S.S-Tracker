import SwiftUI
import MapKit

struct FrontPageView: View {
    @ObservedObject var viewModel = FrontPageViewModel()
   
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            mapContentView
            Button {
                viewModel.setRegionCoordinateToISS()
            } label: {
                ZStack(alignment: .center) {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                    Image(systemName: "target")
                        .foregroundColor(.black)
                        .font(.system(size: 38))
                }

            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
        }
    }
    
    @ViewBuilder
    private var mapContentView: some View {
        ZStack(alignment: .center) {
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.iSSCordinate) { item in
                MapAnnotation(coordinate: item.cLLocationCordinate2D()) {
                    ATImage(imageType: .local(name: "iss"))
                        .frame(width: 40, height: 40)
                }
            }
            .edgesIgnoringSafeArea(.all)
           
            if viewModel.isCoordinateLoading {
                loadingView
            }
        }
    }
    
    private var loadingView: some View {
        VStack {
            ProgressView()
            Text("🛰️ 🛰️ 🛰️ ..")
                .font(.caption)
                .padding(.top, 8)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct FrontPageView_Previews: PreviewProvider {
    static var previews: some View {
        FrontPageView()
    }
}
