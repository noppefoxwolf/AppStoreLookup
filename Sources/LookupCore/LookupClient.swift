import Foundation
import HTTPTypesFoundation
import HTTPTypes

#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

public struct AppInfo: Codable {
    public let bundleId: String
    public let trackName: String
    public let artworkUrl60: URL
    public let artworkUrl100: URL
    public let artworkUrl512: URL
}

public struct LookupResponse: Codable {
    public let resultCount: Int
    public let results: [AppInfo]
}

extension URLSession {
    public func lookupData(for id: String) async throws -> (LookupResponse, HTTPResponse) {
        let url = URL(string: "https://itunes.apple.com/lookup")!
            .appending(queryItems: [
                URLQueryItem(name: "id", value: id)
            ])
        let request = HTTPRequest(url: url)
        let (data, response) = try await self.data(for: request)
        
        let decoder = JSONDecoder()
        let lookupResponse = try decoder.decode(LookupResponse.self, from: data)
        
        return (lookupResponse, response)
    }
}
