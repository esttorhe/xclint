import Foundation
import Commander
import PathKit
import xcproj
import xclintrules
import Rainbow

let lintCommand = command(Argument<String>("project", description: "Path to the .xcodeproj to be linted")) { (project: String) in
    let path = Path(project)
    if path.extension != "xcodeproj" {
        let message = "Invalid file. It must be a .xcodeproj file".red
        print(message)
        throw CommandError(description: message)
    }
    let project = try XcodeProj(path: path)
    let lintErrors = project.lint()
    if  lintErrors.isEmpty {
        print("Linting succeeded".green)
        return
    }
    log(errors: lintErrors)
    throw CommandError(description: "Linting failed")
}
lintCommand.run()
