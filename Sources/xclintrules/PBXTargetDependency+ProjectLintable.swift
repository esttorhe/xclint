import Foundation
import xcproj

extension PBXTargetDependency: ProjectLintable {
    
    public func lint(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        if let targetProxyError = lintTargetProxy(project: project) {
            errors.append(targetProxyError)
        }
        if let targetError = lintTarget(project: project) {
            errors.append(targetError)
        }
        return errors
    }
    
    fileprivate func lintTargetProxy(project: PBXProj) -> LintError? {
        guard let targetProxy = self.targetProxy else { return nil }
        let exists = project.containerItemProxies.contains(reference: targetProxy)
        if exists { return nil }
        return LintError.missingReference(objectType: String(describing: type(of: self)),
                                          objectReference: reference,
                                          missingReference: "PBXContainerItemProxy<\(targetProxy)>")
    }
    
    fileprivate func lintTarget(project: PBXProj) -> LintError? {
        guard let target = self.target else { return nil }
        let nativeTargetExists = project.nativeTargets.contains(reference: target)
        let aggregateTargetExists = project.aggregateTargets.contains(reference: target)
        if nativeTargetExists || aggregateTargetExists { return nil }
        return LintError.missingReference(objectType: String(describing: type(of: self)),
                                          objectReference: reference,
                                          missingReference: "PBXNativeTarget/PBXAggregateTarget<\(target)>")
    }
    
}
