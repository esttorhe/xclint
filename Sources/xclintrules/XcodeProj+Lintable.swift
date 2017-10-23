import xcproj

extension XcodeProj: Lintable {
    
    public func lint() -> [LintError] {
        return []
    }
    
}
