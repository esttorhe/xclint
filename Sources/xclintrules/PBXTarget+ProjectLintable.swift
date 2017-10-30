import Foundation
import xcproj

// MARK: - PBXTarget <ProjectLintable>
extension PBXTarget: ProjectLintable {
    public func lint(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        if let buildConfigurationListError = lintConfigurationList(project: project) {
            errors.append(buildConfigurationListError)
        }
        errors.append(contentsOf: lintBuildPhases(project: project))
        errors.append(contentsOf: lintDependencies(project: project))
        if let productReferenceError = lintProductReference(project: project) {
            errors.append(productReferenceError)
        }
        return errors
    }
    
    fileprivate func lintConfigurationList(project: PBXProj) -> LintError? {
        if let buildConfigurationList = buildConfigurationList {
            let exists = project.configurationLists.contains(reference: buildConfigurationList)
            if exists { return nil }
            return LintError.missingReference(objectType: String(describing: type(of: self)),
                                              objectReference: reference,
                                              missingReference: "XCConfigurationList<\(buildConfigurationList)>")
            
        } else {
            return LintError.missingAttribute(objectType: String(describing: type(of: self)),
                                              objectReference: reference,
                                              missingAttribute: "buildConfigurationList")
        }
    }
    
    fileprivate func lintBuildPhases(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        buildPhases.forEach { (buildPhaseReference) in
            let exists = project.buildPhases.contains(reference: buildPhaseReference)
            if exists { return }
            errors.append(LintError.missingReference(objectType: String(describing: type(of: self)),
                                                     objectReference: reference,
                                                     missingReference: "PBXBuildPhase<\(buildPhaseReference)>"))
        }
        return errors
    }
    
    fileprivate func lintDependencies(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        dependencies.forEach { (dependencyReference) in
            let exists = project.targetDependencies.contains(reference: dependencyReference)
            if exists { return }
            errors.append(LintError.missingReference(objectType: String(describing: type(of: self)),
                                                     objectReference: reference,
                                                     missingReference: "PBXTargetDependency<\(dependencyReference)>"))
        }
        return errors
    }
    
    fileprivate func lintProductReference(project: PBXProj) -> LintError? {
        guard let productReference = self.productReference else { return nil }
        let exists = project.fileReferences.contains(reference: productReference)
        if exists { return nil }
        return LintError.missingReference(objectType: String(describing: type(of: self)),
                                          objectReference: reference,
                                          missingReference: "PBXFileReference<\(productReference)>")
    }
    
}
