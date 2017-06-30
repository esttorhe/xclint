import Foundation
import Commander
import ShellOut

let printVersionCommand = command { () in
    print("The current version of xcodeprojlint is: \(version)")
}
