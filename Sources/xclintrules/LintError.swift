import Foundation

/// Linting error
public struct LintError: Error {
    
    /// Error name.
    var name: String
    
    /// Encapsulated errors
    var errors: [String]
    
}
