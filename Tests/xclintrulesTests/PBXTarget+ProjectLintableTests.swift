import Foundation
import XCTest
import xcproj

@testable import xclintrules

final class PBXTarget_ProjectLintableTests: XCTestCase {
    
    func test_lintFails_whenConfigurationListAttributeIsMissing() {
        let subject = PBXTarget(reference: "ref", name: "name", buildConfigurationList: nil)
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        let gotErrors = subject.lint(project: project)
        let expected = LintError.missingAttribute(objectType: "PBXTarget", objectReference: "ref", missingAttribute: "buildConfigurationList")
        XCTAssertEqual(gotErrors.first, expected)
    }
    
    func test_lintFails_whenConfigurationListReferenceIsMissing() {
        let subject = PBXTarget(reference: "ref", name: "name", buildConfigurationList: "conf_ref")
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        let gotErrors = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXTarget", objectReference: "ref", missingReference: "XCConfigurationList<conf_ref>")
        XCTAssertEqual(gotErrors.first, expected)
    }
}

