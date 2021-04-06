import UIKit
import CryptoKit

var str = "Hello, playground"

//1 A simple Regex algorithm that check if a string respect a certain logic
func stringContains(string: String, logic: String) {
    let range = NSRange(location: 0, length: logic.utf16.count)
    let regex = try! NSRegularExpression(pattern: "[a-z]at")
    regex.firstMatch(in: logic, options: [], range: range) != nil
}

//2 A simple algorithm that process at big double number and return a small float of it
func returnFloat(double number: Double) -> Float {
    let short = Float(String(format: "%.1f", (number * 10)).dropLast(2))!/10
    return short
}

//3 A simple algorithm to return the difference betweens two arrays
extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
/// 4. A simple algorithm that checks if an array contains a certain element
extension Array {
    func isContaining<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}

/// 5.  A simple algorithm that return fibonacci numbers for a specific integer
func fibonacciNumbers(n:Int) -> [Int]{
    var fibonacciArray:[Int] = []
    var (a,b) = (0, 1)
    while a < n {
        (a, b) = (b, a + b)
        if a <= n {
            fibonacciArray.append(a)
        }
    }
    return fibonacciArray
}

/// 6. A simple algorithm that return a truncated string with a specified length
extension String {
    func truncate(length: Int, trailing: String = "") -> String {
        if self.count > length {
            return String(self.prefix(length)) + trailing
        } else {
            return self
        }
    }
}



// Get string and return uicolor without alpha
extension String {
    var returnUIColor: UIColor {
        var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

// Extension for uiview to handle all properties of view.layer from border to shadow
extension UIView {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
// Check if a String contains a special character
extension String {
    var containsSpecialCharacters: Bool {
        let regex = ".*[^A-Za-z0-9].*"
        let string = NSPredicate(format: "SELF MATHCES %@", regex)
        return string.evaluate(with: self)
    }
}
// Check if a string is a phone number
extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}

extension String {
    func rot13() -> String {
        return ROT13.string(self)
    }
}

extension Int {
    /// Add  decimal format to a integer
    var withComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: self)) else {
            fatalError("Unable to format this number into a decimal format")
        }
        return formattedNumber
    }
}

extension String {
    /// Convert Html to normal string
    var html2String: String {
        guard let data = data(using: .utf8), let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil) else {
            return self
        }
        return attributedString.string
    }
    
    var hashed_256: String {
        let inputData = Data(self.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
}
