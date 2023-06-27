import Foundation

class JsonReader {
    static func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    static func decodeJSON<T>(data: Data) -> T? where T: Decodable {
        do {
            let item  = try JSONDecoder().decode(T.self, from: data)
            return item
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}

