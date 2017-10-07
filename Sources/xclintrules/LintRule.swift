import Foundation
import xcproj

/// Protocol that defines a lint rule
public protocol LintRule {

    /// Lints a project returning an error if there's any.
    ///
    /// - Parameter project: project to be linted.
    /// - Returns: error if the linting fails.
    func lint(project: XcodeProj) -> LintError?
    
}
