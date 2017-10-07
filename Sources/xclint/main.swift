import Foundation
import Commander
import PathKit
import xcproj
import xclintrules

let lintCommand = command(Argument<String>("project", description: "Path to the .xcodeproj to be linted")) { (project: String) in
    let path = Path(project)
    if path.extension != "xcodeproj" {
        let message = "Invalid file. It must be a .xcodeproj file"
        print(message)
        throw CommandError(description: message)
    }
    let project = try XcodeProj(path: path)
    let errors = allRules.flatMap({ $0.lint(project: project) })
    if errors.isEmpty {
        print("Linting succeeded")
        return
    }
    log(errors: errors)
    throw CommandError(description: "Linting failed")
}
lintCommand.run()
