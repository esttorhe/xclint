import Foundation
import Rainbow

fileprivate let levelSymbols = [ ">", "-", "•"]

// Logs all the linting errors
public func log(errors: [LintError], level: Int = 0) {
    let symbol = (level < levelSymbols.count) ? levelSymbols[level] : levelSymbols[levelSymbols.count-1]
    let prefix = String(repeating: " ", count: level) + symbol
    errors.forEach { (error) in
        var errorMessage = prefix + " " + error.name.yellow + " - " + error.description
        errorMessage += error.errors.isEmpty ? "." : ":"
        if !error.errors.isEmpty { log(errors: error.errors, level: level + 1) }
    }
}
