import Foundation

var lastTickTimestamp = Date().timeIntervalSince1970
let interval: Double = 2

func request(url: String, completion: @escaping (Data?) -> Void) {
    DispatchQueue.global().async {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            completion(nil)
            return
        }
        completion(data)
    }
}

func write(data: Data, name: String) {
    let path = "/Users/maciejchmielewski/Desktop/data/" + name
    try? data.write(to: URL(fileURLWithPath: path))
    print(path)
}

var lastData = "none".data(using: .utf8)!
while true {
    while Date().timeIntervalSince1970 < lastTickTimestamp + interval {}
    lastTickTimestamp = Date().timeIntervalSince1970
    request(url: "https://google.com") {
        write(data: $0 ?? lastData, name: String(Int(lastTickTimestamp)))
        if let data = $0 {
            lastData = data
        }
    }
    
}
