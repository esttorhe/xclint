import Foundation
import XCTest
import xcproj

@testable import xclintrules

final class PBXBuildFile_ProjectLintableTests: XCTestCase {
    
    func test_lintingFails_whenTheFileReferenceDoesntExist() {
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        let subject = PBXBuildFile(reference: "ref", fileRef: "fileRef", settings: nil)
        let error = LintError.missingReference(objectType: "PBXBuildFile", objectReference: "ref", missingReference: "fileRef")
        let gotErrors = subject.lint(project: project)
        XCTAssertEqual(gotErrors.first, error)
    }
    
}
