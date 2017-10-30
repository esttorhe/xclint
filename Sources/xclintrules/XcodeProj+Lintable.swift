import xcproj

// MARK: - XcodeProj <Lintable>
extension XcodeProj: Lintable {
    
    public func lint() -> [LintError] {
        var errors: [LintError] = []
        errors.append(contentsOf: lintDuplicates())
        errors.append(contentsOf: pbxproj.buildFiles.flatMap({ $0.lint(project: pbxproj) }))
        errors.append(contentsOf: pbxproj.aggregateTargets.flatMap({ $0.lint(project: pbxproj) }))
        errors.append(contentsOf: pbxproj.nativeTargets.flatMap({ $0.lint(project: pbxproj) }))
        errors.append(contentsOf: pbxproj.containerItemProxies.flatMap({ $0.lint(project: pbxproj) }))
        return errors
    }
    
    fileprivate func lintDuplicates() -> [LintError] {
        return pbxproj.objects
            .reduce(into: [String: [PBXObject]](), { $0[$1.reference, default: []].append($1) })
            .filter({$0.value.count != 1})
            .map { (reference, _) -> LintError in
                return LintError.duplicatedReference(reference: reference)
            }
    }
    
}
