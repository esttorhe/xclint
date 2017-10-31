import Foundation
import xcproj

extension XCConfigurationList: ProjectLintable {
    
    // MARK: - Public
    
    public func lint(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        errors.append(contentsOf: lintBuildConfigurations(project: project))
        return errors
    }
    
    // MARK: - Fileprivate
    
    fileprivate func lintBuildConfigurations(project: PBXProj) -> [LintError] {
       return buildConfigurations
        .flatMap { (buildConfigurationReference) -> LintError? in
            let exists = project.buildConfigurations.contains(reference: buildConfigurationReference)
            if exists { return nil }
            return LintError.missingReference(objectType: String(describing: type(of: self)),
                                              objectReference: reference,
                                              missingReference: "XCBuildConfiguration<\(buildConfigurationReference)>")
            
        }
    }
    
}
