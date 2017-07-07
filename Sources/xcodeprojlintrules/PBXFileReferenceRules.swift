import Foundation
import xcodeproj

public extension PBXFileReference {
    
    static var rules: [LintRule] {
        return [Duplicated()]
    }
    
    // MARK: - Duplicated
    
    struct Duplicated: LintRule {

        public var name: String = "duplicated_file_reference"

        public var description: String = "Detects if a file reference appears more than once in the project"
        
        
        public func lint(project: XcodeProj) throws {
            var times: [xcodeproj.UUID: UInt] = [:]
            project.pbxproj
                .objects
                .fileReferences
                .forEach { (reference) in
                    var count: UInt = 0
                    if let existingCount = times[reference.reference] {
                        count = existingCount
                    }
                    count += 1
                    times[reference.reference] = count
                }
            let duplicatedReferences = times.filter { $0.value != 1 }.map { $0.key }
            if duplicatedReferences.count != 0 {
                throw Duplicated.Error(referenes: duplicatedReferences, project: project)
            }
        }

        public struct Error: FixableError {
            
            let referenes: [xcodeproj.UUID]
            let project: XcodeProj
            
            func fix() throws {
                // TODO
            }
            
            public var description: String {
                return "The following PBXFileReferences are referenced more than once in the project: \(self.referenes.joined(separator: ", "))"
            }
            
        }
        
    }
    
}
