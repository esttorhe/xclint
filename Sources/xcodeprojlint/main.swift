import Commander
import xcodeprojlintcommands

let group = Group {
    $0.addCommand("lint", "Lint your .xcodeproj", LintCommand)
    $0.addCommand("rules", "Print all the linting rules", RulesCommand)
    $0.addCommand("autocorrect", "Autocorrect your project", AutoCorrectCommand)
    $0.addCommand("version", "Displays the current version of xcodeprojlint", PrintVersionCommand)
}

group.run()
