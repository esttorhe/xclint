import Foundation
import xcproj

extension PBXGroup: ProjectLintable {
    
    public func lint(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        errors.append(contentsOf: lintChildren(project: project))
        return errors
    }
    
    fileprivate func lintChildren(project: PBXProj) -> [LintError] {
        return children
            .flatMap { (childReference) -> LintError? in
                let groupExists = project.groups.contains(reference: childReference)
                let variantGroupExists = project.variantGroups.contains(reference: childReference)
                let fileReferenceExists = project.fileReferences.contains(reference: childReference)
                if groupExists || variantGroupExists || fileReferenceExists { return nil }
                return LintError.missingReference(objectType: String(describing: type(of: self)),
                                                  objectReference: reference,
                                                  missingReference: "PBXFileReference/PBXGroup/PBXVariantGroup<\(childReference)>")
            }
    }
    
}
