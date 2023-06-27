import MapKit
import SatelliteKit
import SwiftUI
import Combine

class FrontPageViewModel: ObservableObject {
    @Published private (set) var iSSCordinate: [ISSLocation] = [ISSLocation.init(message: "", issPosition: .init(latitude: "-1", longitude: "-2"), timestamp: 1)]
    @Published private (set) var region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 40.83834587046632,
                    longitude: 14.254053016537693),
                span: MKCoordinateSpan(
                    latitudeDelta: 15,
                    longitudeDelta: 15)
                )
    @Published private (set) var isCoordinateLoading: Bool = true
    
    private var isFirstSet = true
    
    private var cancellable = Set<AnyCancellable>()

    let timer = Timer.publish(every: 5, on: .main, in: .defaultRunLoopMode)
        .autoconnect()
    
     init() {
         timer.flatMap { _ in DataService.instance.requestLocationISS()}
             .receive(on: DispatchQueue.main)
             .sink { completion in
                 #if DEBUG
                 print("Completeion: \(completion)")
                 #endif
             } receiveValue: { [weak self] location in
                 guard let self = self else { return }
                 
                 self.iSSCordinate[0] = location
                 self.isCoordinateLoading = false
                 
                 if self.isFirstSet {
                     self.isFirstSet = false
                     self.region.center = location.cLLocationCordinate2D()
                 }
             }
             .store(in: &cancellable)
    }
        
    public func setRegionCoordinateToISS() {
        region.center = iSSCordinate[0].cLLocationCordinate2D()
    }
}

extension ISSLocation {
    func cLLocationCordinate2D() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: Double(self.issPosition.latitude) ?? -1, longitude: Double(self.issPosition.longitude) ?? -1)
    }
}
 
