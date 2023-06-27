import Foundation
import Combine


internal class DataService
{
     static let instance = DataService()
    
     //MARK: Endpoints
     let issLocationEndpoint  = "http://api.open-notify.org/iss-now.json"
     let issCrewEndpoint      = "http://api.open-notify.org/astros.json"
    
     //MARK: Keys for UserDefault
     let issPositionKey  = "IssPositionOnMap"
     let issTimeStampKey = "IssTime"
    
     var iSSLocation : ISSLocation?
    
    func requestLocationISS() -> AnyPublisher<ISSLocation, Error>
    {
        guard let url = URL(string: issLocationEndpoint) else
        {
            return Fail(error: APIError.URL_Problem)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ISSLocation.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
