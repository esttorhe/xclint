import Foundation
import Commander

public let PrintVersionCommand = command { () in
    print("The current version of xcodeprojlint is: \(version)")
}
