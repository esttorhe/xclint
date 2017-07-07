import Foundation
import xcodeproj

/// Protocol that defines a linting rule
public protocol LintRule {
    
    /// Rule name.
    var name: String { get }
    
    /// Rule description.
    var description: String { get }
    
    /// Method that executes the linting rule with the givenproject.
    ///
    /// - Parameter project: project to be linted.
    /// - Throws: an error if the linting fails.
    func lint(project: XcodeProj) throws
    
}
