import Foundation

/// Linting error
public struct LintError: Error {
    
    /// Error name.
    var name: String
    
    /// Description
    var description: String
    
    /// Encapsulated errors
    var errors: [LintError]
    
}
