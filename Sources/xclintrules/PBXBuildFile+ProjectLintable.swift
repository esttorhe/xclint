import Foundation
import xcproj

extension PBXBuildFile: ProjectLintable {
    
    // MARK: - Public
    
    public func lint(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        if let fileRefError = lintFileRef(project: project) {
            errors.append(fileRefError)
        }
        return errors
    }
    
    // MARK: - Fileprivate
    
    fileprivate func lintFileRef(project: PBXProj) -> LintError? {
        if let fileRef = fileRef {
            let exists = project.fileReferences.contains(reference: fileRef)
            if exists { return nil }
            return LintError.missingReference(objectType: String(describing: type(of: self)),
                                              objectReference: reference,
                                              missingReference: "PBXFileReference<\(fileRef)>")
        } else {
            return LintError.missingAttribute(objectType: String(describing: type(of: self)),
                                              objectReference: reference,
                                              missingAttribute: "fileRef")
        }
        
    }
    
}
