import Foundation
import XCTest

@testable import xclintrules

final class LintErrorTests: XCTestCase {
    
    func test_missingReference_hasTheCorrectAttributes() {
        let subject = LintError.missingReference(objectType: "type", objectReference: "obj_ref", missingReference: "miss_ref")
        XCTAssertEqual(subject.name, "Missing reference")
        XCTAssertEqual(subject.description, "type<obj_ref> has a reference to a file <miss_ref> that doesn't exist")
        XCTAssertTrue(subject.errors.isEmpty)
    }
    
    func test_missingAttribute_hasThecorrectAttributes() {
        let subject = LintError.missingAttribute(objectType: "type", objectReference: "obj_ref", missingAttribute: "miss_attr")
        XCTAssertEqual(subject.name, "Missing attribute")
        XCTAssertEqual(subject.description, "type<obj_ref> is missing attribute miss_attr")
        XCTAssertTrue(subject.errors.isEmpty)
    }
    
}
