import xcproj

// MARK: - XcodeProj <Lintable>
extension XcodeProj: Lintable {
    
    public func lint() -> [LintError] {
        var errors: [LintError] = []
        errors.append(contentsOf: pbxproj.buildFiles.flatMap({ $0.lint(project: pbxproj) }))
        return errors
    }
    
}
