import Foundation
import XCTest
import xcproj

@testable import xclintrules

final class PBXContainerItemProxy_ProjectLintableTests: XCTestCase {

    func test_lintFails_whenRemoteGlobalIDStringReferenceIsMissing() {
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        project.addObject(PBXProject(name: "name", reference: "container", buildConfigurationList: "list", compatibilityVersion: "version", mainGroup: "group"))
        let subject = PBXContainerItemProxy(reference: "ref", containerPortal: "container", remoteGlobalIDString: "remote")
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXContainerItemProxy", objectReference: "ref", missingReference: "PBXFileReference<remote>")
        XCTAssertEqual(got.count, 1)
        XCTAssertEqual(got.first, expected)
    }
    
    func test_lintFails_whenContainerPortalIsMissing() {
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        let subject = PBXContainerItemProxy(reference: "ref", containerPortal: "container")
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXContainerItemProxy", objectReference: "ref", missingReference: "PBXProject<container>")
        XCTAssertEqual(got.count, 1)
        XCTAssertEqual(got.first, expected)
    }

}
