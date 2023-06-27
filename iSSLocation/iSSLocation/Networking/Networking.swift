import Foundation

enum APIError: Error {
    case URL_Problem
    case invalidResponce
    case unknown
    case apiError(reason: String)


    var errorDescription: String? {
        switch self {
        case .URL_Problem:
            return "URL requestion is not correct!"
        case .invalidResponce:
            return "Invalid responce"
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}
