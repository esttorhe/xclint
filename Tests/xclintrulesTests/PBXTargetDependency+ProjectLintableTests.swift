import Foundation
import XCTest
import xcproj

@testable import xclintrules

final class PBXTargetDependency_ProjectLintableTests: XCTestCase {

    func test_lintFails_whenTargetProxyIsMissing() {
        let project = PBXProj(objectVersion: 0, rootObject: "")
        let subject = PBXTargetDependency(reference: "ref", targetProxy: "proxy")
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXTargetDependency", objectReference: "ref", missingReference: "PBXContainerItemProxy<proxy>")
        XCTAssertEqual(got.first, expected)
    }
    
    func test_lintFails_whenTargetIsMissing() {
        let project = PBXProj(objectVersion: 0, rootObject: "")
        let subject = PBXTargetDependency(reference: "ref", target: "target")
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXTargetDependency", objectReference: "ref", missingReference: "PBXNativeTarget/PBXAggregateTarget<target>")
        XCTAssertEqual(got.first, expected)
    }

}
