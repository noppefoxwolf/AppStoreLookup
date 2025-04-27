import Testing
@testable import LookupCore

@Suite
struct AppIDExtractorTests {
    @Test
    func example() throws {
        let url = "https://apps.apple.com/jp/app/nightfox-dawn-for-mastodon/id1668645019"
        let id = AppIDExtractor.extract(from: url)
        #expect(id == "1668645019")
    }
}


