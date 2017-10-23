import xcproj

// MARK: - XcodeProj <Lintable>
extension XcodeProj: Lintable {
    
    public func lint() -> [LintError] {
        var errors: [LintError] = []
        errors.append(contentsOf: pbxproj.buildFiles.flatMap({ $0.lint(project: pbxproj) }))
        errors.append(contentsOf: pbxproj.aggregateTargets.flatMap({ $0.lint(project: pbxproj) }))
        errors.append(contentsOf: pbxproj.nativeTargets.flatMap({ $0.lint(project: pbxproj) }))
        return errors
    }
    
}
