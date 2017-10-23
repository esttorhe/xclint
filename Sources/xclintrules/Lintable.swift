import Foundation
import xcproj

/// Lintable protocol
public protocol Lintable {
    
    /// Lints an element returning an error if there's any.
    ///
    /// - Returns: errors if the linting fails.
    func lint() -> [LintError]
    
}

/// ProjectLintable protocol
public protocol ProjectLintable {

    /// Lints an element returning an error if there's any.
    ///
    /// - Parameter project: project used for linting.
    /// - Returns: error if the linting fails.
    func lint(project: PBXProj) -> [LintError]
    
}
