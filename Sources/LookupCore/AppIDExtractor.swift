import RegexBuilder

public struct AppIDExtractor {
    enum AppIDExtractorError: Error {
        case notFound
    }
    
    public static func extract(from url: String) throws -> String {
        // パターン定義
        let patterns = [
            // パターン1: id後の数字を抽出 (例: id333903271)
            Regex {
                "id"
                Capture {
                    OneOrMore(.digit)
                }
            },
            // パターン2: /id/数字を抽出 (例: /id/333903271)
            Regex {
                "/id/"
                Capture {
                    OneOrMore(.digit)
                }
            }
        ]
        
        for pattern in patterns {
            if let match = try? pattern.firstMatch(in: url) {
                let captured = match.output.1
                return String(captured)
            }
        }
        
        throw AppIDExtractorError.notFound
    }
}
