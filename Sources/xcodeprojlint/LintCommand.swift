import Foundation
import Commander

/// Command that lints the Xcode project.
public let LintCommand = command(Option("path",
                                 ".xcodeprojlint.yml",
                                 flag: "p",
                                 description: "Linting configuration file .xcodeprojlint.yml"),
                          Flag("quite",
                               flag: "q",
                               description: "True if you don't want the logs to be printed",
                               default: false)) { (_, _) in
}
