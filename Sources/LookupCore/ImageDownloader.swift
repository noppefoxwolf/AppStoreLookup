import Foundation

#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

public final class ImageDownloader: Sendable {
    public init() {}
    public func download(url: URL) async throws -> URL {
        let response = try await URLSession.shared.download(from: url)
        return response.0
    }
}

