import Foundation
import xcproj


// MARK: - PBXTarget <ProjectLintable>
extension PBXTarget: ProjectLintable {
    public func lint(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        if let buildConfigurationListError = lintConfigurationList(project: project) {
            errors.append(buildConfigurationListError)
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
    
}
