import Foundation
import XCTest
import xcproj

@testable import xclintrules

final class PBXProject_ProjectLintableTests: XCTestCase {
    
    func test_lintFails_whenBuildConfigurationListIsMissing() {
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        project.addObject(PBXGroup(reference: "main_group", children: []))
        let subject = PBXProject(name: "name", reference: "ref", buildConfigurationList: "config_list", compatibilityVersion: "version", mainGroup: "main_group")
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXProject",
                                                  objectReference: "ref",
                                                  missingReference: "XCConfigurationList<config_list>")
        XCTAssertEqual(got.first, expected)
    }
    
    func test_lintFails_whenMainGroupIsMissing() {
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        project.addObject(XCConfigurationList(reference: "config_list", buildConfigurations: []))
        let subject = PBXProject(name: "name", reference: "ref", buildConfigurationList: "config_list", compatibilityVersion: "version", mainGroup: "main_group")
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXProject",
                                                  objectReference: "ref",
                                                  missingReference: "PBXGroup<main_group>")
        XCTAssertEqual(got.first, expected)
    }
    
    func test_lintFails_whenProductRefGroupIsMissing() {
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        project.addObject(XCConfigurationList(reference: "config_list", buildConfigurations: []))
        project.addObject(PBXGroup(reference: "main_group", children: []))
        let subject = PBXProject(name: "name", reference: "ref", buildConfigurationList: "config_list", compatibilityVersion: "version", mainGroup: "main_group", productRefGroup: "ref_group")
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXProject",
                                                  objectReference: "ref",
                                                  missingReference: "PBXGroup<ref_group>")
        XCTAssertEqual(got.first, expected)
    }
    
    func test_lintFails_whenAnyTargetIsMissing() {
        let project = PBXProj(objectVersion: 0, rootObject: "root")
        project.addObject(XCConfigurationList(reference: "config_list", buildConfigurations: []))
        project.addObject(PBXGroup(reference: "main_group", children: []))
        let subject = PBXProject(name: "name", reference: "ref", buildConfigurationList: "config_list", compatibilityVersion: "version", mainGroup: "main_group", targets: ["target"])
        let got = subject.lint(project: project)
        let expected = LintError.missingReference(objectType: "PBXProject",
                                                  objectReference: "ref",
                                                  missingReference: "PBXNativeTarget/PBXAggregateTarget<target>")
        XCTAssertEqual(got.first, expected)
    }

}


