import Foundation
import XCTest
import xcproj

@testable import xclintrules

final class XCConfigurationList_ProjectLintableTests: XCTestCase {
    
    func test_lintFails_whenChildrenAreMissing() {
        let subject = XCConfigurationList(reference: "ref", buildConfigurations: ["conf"])
        let project = PBXProj(objectVersion: 0, rootObject: "1")
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "XCConfigurationList", objectReference: "ref", missingReference: "XCBuildConfiguration<conf>")
        XCTAssertEqual(got.first, expected)
    }
    
}

