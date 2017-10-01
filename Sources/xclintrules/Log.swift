import Foundation

// Logs all the linting errors
public func log(errors: [LintError]) {
    errors.forEach { (error) in
        print("> Failed: \(error.name)")
        error.errors.forEach({ (_error) in
            print("  - \(_error)")
        })
    }
}
