import Foundation
import xcproj

// MARK: - PBXBuildFile <ProjectLintable>
extension PBXBuildFile: ProjectLintable {
    
    public func lint(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        if let fileRefError = lintFileRef(project: project) {
            errors.append(fileRefError)
        }
        return errors
    }
    
    /// Lints that the build file has a fileRef attribute and it points to an file that exists in the project.
    ///
    /// - Parameter project: project where the file reference should be contained.
    /// - Returns: errors if the linting fails.
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
