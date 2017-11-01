import Foundation
import XCTest
import xcproj

@testable import xclintrules

final class PBXVariantGroup_ProjectLintableTests: XCTestCase {
    
    func test_lintFails_whenChildrenAreMissing() {
        let subject = PBXVariantGroup(reference: "ref", children: ["child"])
        let project = PBXProj(objectVersion: 0, rootObject: "1")
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXVariantGroup", objectReference: "ref", missingReference: "PBXFileReference/PBXGroup/PBXVariantGroup<child>")
        XCTAssertEqual(got.first, expected)
    }
    
}

