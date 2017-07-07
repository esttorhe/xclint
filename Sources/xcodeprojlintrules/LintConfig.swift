import Foundation
import xcodeproj

/// Lint configuration.
struct LintConfig {

    // MARK: - Attributes
    
    /// Linting rules.
    let rules: [XcodeprojLinting]
    
    /// Linting rules that are excluded.
    let excludedRules: [XcodeprojLinting]
    
    /// Project to be linted.
    let project: XcodeProj
    
    // MARK: - Init
    
    /// Default LintConfig constructor.
    ///
    /// - Parameters:
    ///   - project: project to be linted.
    ///   - rules: linting rules.
    ///   - excludedRules: excluded linting rules.
    init(project: XcodeProj,
         rules: [XcodeprojLinting] = allRules,
         excludedRules: [XcodeprojLinting] = []) {
        self.project = project
        self.rules = rules
        self.excludedRules = excludedRules
    }
    
}
