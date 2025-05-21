import Foundation
import ArgumentParser
import RegexBuilder
import LookupCore

#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

struct AppstoreLookup: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "app-icon-fetcher",
        abstract: "AppStoreのURLからアプリのbundleIDとアイコン画像URLを取得します"
    )
    
    @Argument(
        help: "AppStoreのURL (例: https://apps.apple.com/jp/app/twitter/id333903271)"
    )
    var appStoreUrl: String
    
    @Option(
        name: .customLong("output"),
        help: "アイコン画像を保存する出力ディレクトリのパス"
    )
    var outputPath: String = ""
    
    func run() async throws {
        let appID = try AppIDExtractor.extract(from: appStoreUrl)
        let (response, _) = try await URLSession.shared.lookupData(for: appID)
        let appInfo = response.results[0]
        let (url, _) = try await URLSession.shared.download(from: appInfo.artworkUrl512)
        
        var outputURL = URL(filePath: outputPath)
        let fileName = "\(appInfo.bundleId).png"
        outputURL.append(path: fileName)
        
        try FileManager.default.moveItem(at: url, to: outputURL)
    }
}
