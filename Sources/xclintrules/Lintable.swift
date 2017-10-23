import Foundation
import xcproj

/// Lintable protocol
public protocol Lintable {
    
    /// Lints an element returning an error if there's any.
    ///
    /// - Returns: errors if the linting fails.
    func lint() -> [LintError]
    
}
