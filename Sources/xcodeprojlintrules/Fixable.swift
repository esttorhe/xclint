import Foundation

protocol FixableError: Error, CustomStringConvertible {
    func fix() throws
}
