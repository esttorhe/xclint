import Commander

let lintCommand = command(Option("path",
                                 ".xcodeprojlint.yml",
                                 flag: "p",
                                 description: "Linting configuration file .xcodeprojlint.yml"),
                          Flag("quite",
                               flag: "q",
                               description: "True if you don't want the logs to be printed",
                               default: false)) { (_, _) in
}

let autoCorrectCommand = command { () in
}

let group = Group {
    $0.addCommand("lint", "Lint your .xcodeproj", lintCommand)
    $0.addCommand("rules", "Print all the linting rules", rulesCommand)
    $0.addCommand("autocorrect", "Autocorrect your project", autoCorrectCommand)
    $0.addCommand("version", "Displays the current version of xcodeprojlint", printVersionCommand)
}

group.run()
