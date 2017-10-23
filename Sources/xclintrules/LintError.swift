import Foundation

/// Linting error
public struct LintError: Error {
    
    /// Error name.
    var name: String
    
    /// Description
    var description: String
    
    /// Encapsulated errors
    var errors: [LintError]
    
    /// Default LintError constructor.
    ///
    /// - Parameters:
    ///   - name: lint error name.
    ///   - description: lint error description.
    ///   - errors: nested errors.
    public init(name: String, description: String, errors: [LintError] = []) {
        self.name = name
        self.description = description
        self.errors = errors
    }
}


// MARK: - LintError <Equatable>

extension LintError: Equatable {
    public static func ==(lhs: LintError, rhs: LintError) -> Bool {
        return lhs.name == rhs.name &&
        lhs.description == rhs.description &&
        lhs.errors == rhs.errors
    }
}

// MARK: - LintError Convenience Initializers

extension LintError {
    
    static func missingReference(objectType: String,
                                 objectReference: String,
                                 missingReference: String) -> LintError {
        return LintError(name: "Missing reference",
                         description: "\(objectType)<\(objectReference)> has a reference to a file <\(missingReference)> that doesn't exist")
    }
    
    static func missingAttribute(objectType: String,
                                 objectReference: String,
                                 missingAttribute: String) -> LintError {
        return LintError(name: "Missing attribute",
                         description: "\(objectType)<\(objectReference)> is missing attribute \(missingAttribute)")
    }
}
