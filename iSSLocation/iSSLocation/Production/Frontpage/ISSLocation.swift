import Foundation

struct ISSLocation : Codable, Identifiable
{
    
    var id = UUID()
    let message: String
    let issPosition: IssPosition
    let timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case message
        case issPosition = "iss_position"
        case timestamp
    }
    
    //MARK: Just for showing in Console
    func getMessageLocation() -> String {
        "Message :\(message), Lat :\(issPosition.latitude), Lon: \(issPosition.longitude), TimeStamp: \(timestamp))"
    }
    
    //MARK: Unix to UTC
    func getUTCTime() -> Date
    {
        return Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
}

struct IssPosition: Codable {
    let latitude, longitude: String
}


