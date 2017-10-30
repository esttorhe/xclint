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
    
    func test_lintFails_whenBuildPhaseReferenceIsMissing() {
        let subject = PBXTarget(reference: "ref", name: "name", buildConfigurationList: "list", buildPhases: ["phase"])
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        project.addObject(XCConfigurationList(reference: "list", buildConfigurations: []))
        let gotErrors = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXTarget",
                                                  objectReference: "ref", missingReference: "PBXBuildPhase<phase>")
        XCTAssertEqual(gotErrors.first, expected)
    }
    
    func test_lintFails_whenADependencyIsMissing() {
        let subject = PBXTarget(reference: "ref", name: "name", buildConfigurationList: "list", dependencies: ["target_dep"])
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        project.addObject(XCConfigurationList(reference: "list", buildConfigurations: []))
        let gotErrors = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXTarget",
                                                  objectReference: "ref",
                                                  missingReference: "PBXTargetDependency<target_dep>")
        XCTAssertEqual(gotErrors.first, expected)
    }
    
    func test_lintFails_whenProductReferenceIsMissing() {
        let subject = PBXTarget(reference: "ref", name: "name", buildConfigurationList: "list", productReference: "product_ref")
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        project.addObject(XCConfigurationList(reference: "list", buildConfigurations: []))
        let gotErrors = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXTarget",
                                                  objectReference: "ref",
                                                  missingReference: "PBXFileReference<product_ref>")
        XCTAssertEqual(gotErrors.first, expected)
    }
}
