import Foundation

var lastTickTimestamp = Date().timeIntervalSince1970
let interval: Double = 2

while true {
    while Date().timeIntervalSince1970 < lastTickTimestamp + interval {}
    lastTickTimestamp = Date().timeIntervalSince1970
    print("xd")
}
