import Foundation
import xcproj

// MARK: - PBXBuildFile <ProjectLintable>
extension PBXBuildFile: ProjectLintable {
    
    public func lint(project: PBXProj) -> [LintError] {
        var errors: [LintError] = []
        errors.append(contentsOf: lintMissingFileRef(project: project))
        return errors
    }
    
    /// Lints that the build file has a fileRef attribute and it points to an file that exists in the project.
    ///
    /// - Parameter project: project where the file reference should be contained.
    /// - Returns: errors if the linting fails.
    fileprivate func lintMissingFileRef(project: PBXProj) -> [LintError] {
        if fileRef == nil {
            return [
                LintError.missingAttribute(objectType: String(describing: type(of: self)),
                                           objectReference: reference,
                                           missingAttribute: "fileRef")
            ]
        } else {
            let exists = project.fileReferences.filter({ $0.reference == fileRef }).count != 0
            if exists { return [] }
            return [
                LintError.missingReference(objectType: String(describing: type(of: self)),
                                           objectReference: reference,
                                           missingReference: fileRef!)
            ]
        }
        
    }
    
}
