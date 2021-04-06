import Foundation

/// Take a string and return a transformed string using `ROT13`
struct ROT13 {
    private static var key = [Character: Character]()
    
    private static let uppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private static let lowercase = Array("abcdefghijklmnopqrstuvwxyz")
    
    static func string(_ string: String) ->  String {
        if ROT13.key.isEmpty {
            for i in 0..<26 {
                ROT13.key[ROT13.uppercase[i]] = ROT13.uppercase[(i + 13) % 26]
                ROT13.key[ROT13.lowercase[i]] = ROT13.lowercase[(i + 13) % 26]
            }
        }
        let transformed = string.map{ ROT13.key[$0] ?? $0}
        return String(transformed)
        
    }
}
extension String {
    func rot13() -> String {
        return ROT13.string(self)
    }
}


// Usage
let name = "Cédric Bahirwe"

let convertedName = name.rot13()
print(convertedName)
// To same extension is used convert back the transformed text.
let restoreName = convertedName.rot13()

print(name)
