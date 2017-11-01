import Foundation
import xcproj

extension PBXProject: ProjectLintable {
    
    public func lint(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        if let buildConfigurationError = lintBuildConfigurationList(project: project) {
            errors.append(buildConfigurationError)
        }
        if let mainGroupError = lintMainGroup(project: project) {
            errors.append(mainGroupError)
        }
        if let productRefGroupError = lintProductRefGroup(project: project) {
            errors.append(productRefGroupError)
        }
        errors.append(contentsOf: lintTargets(project: project))
        return errors
    }
    
    fileprivate func lintBuildConfigurationList(project: PBXProj) -> LintError? {
        let exists = project.configurationLists.contains(reference: buildConfigurationList)
        if exists { return nil }
        return LintError.missingReference(objectType: String(describing: type(of: self)),
                                          objectReference: reference,
                                          missingReference: "XCConfigurationList<\(buildConfigurationList)>")
    }
    
    fileprivate func lintMainGroup(project: PBXProj) -> LintError? {
        let exists = project.groups.contains(reference: mainGroup)
        if exists { return nil }
        return LintError.missingReference(objectType: String(describing: type(of: self)),
                                          objectReference: reference,
                                          missingReference: "PBXGroup<\(mainGroup)>")
    }
    
    fileprivate func lintProductRefGroup(project: PBXProj) -> LintError? {
        guard let productRefGroup = self.productRefGroup else { return nil }
        let exists = project.groups.contains(reference: productRefGroup)
        if exists { return nil }
        return LintError.missingReference(objectType: String(describing: type(of: self)),
                                          objectReference: reference,
                                          missingReference: "PBXGroup<\(productRefGroup)>")
    }
    
    fileprivate func lintTargets(project: PBXProj) -> [LintError] {
        return targets
            .flatMap { targetReference in
                let nativeTargetExists = project.nativeTargets.contains(reference: targetReference)
                let aggregateTargetExists = project.aggregateTargets.contains(reference: targetReference)
                if nativeTargetExists || aggregateTargetExists { return nil }
                return LintError.missingReference(objectType: String(describing: type(of: self)),
                                                  objectReference: reference,
                                                  missingReference: "PBXNativeTarget/PBXAggregateTarget<\(targetReference)>")
            }
    }
    
}


// targets

