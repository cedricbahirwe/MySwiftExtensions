import Foundation
import UIKit
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
//4 A simple algorithm that checks if an array contains a certain element
extension Array {
    func isContaining<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
    var nationalities: [String] {
        return ["Afghan", "Albanian", "Algerian", "American", "Andorran", "Angolan", "Antiguans", "Argentinean", "Armenian", "Australian", "Austrian", "Azerbaijani", "Bahamian", "Bahraini", "Bangladeshi", "Barbadian", "Barbudans", "Batswana", "Belarusian", "Belgian", "Belizean", "Beninese", "Bhutanese", "Bolivian", "Bosnian", "Brazilian", "British", "Bruneian", "Bulgarian", "Burkinabe", "Burmese", "Burundian", "Cambodian", "Cameroonian", "Canadian", "Cape Verdean", "Central African", "Chadian", "Chilean", "Chinese", "Colombian", "Comoran", "Congolese", "Costa Rican", "Croatian", "Cuban", "Cypriot", "Czech", "Danish", "Djibouti", "Dominican", "Dutch", "East Timorese", "Ecuadorean", "Egyptian", "Emirian", "Equatorial Guinean", "Eritrean", "Estonian", "Ethiopian", "Fijian", "Filipino", "Finnish", "French", "Gabonese", "Gambian", "Georgian", "German", "Ghanaian", "Greek", "Grenadian", "Guatemalan", "Guinea-Bissauan", "Guinean", "Guyanese", "Haitian", "Herzegovinian", "Honduran", "Hungarian", "I-Kiribati", "Icelander", "Indian", "Indonesian", "Iranian", "Iraqi", "Irish", "Israeli", "Italian", "Ivorian", "Jamaican", "Japanese", "Jordanian", "Kazakhstani", "Kenyan", "Kittian and Nevisian", "Kuwaiti", "Kyrgyz", "Laotian", "Latvian", "Lebanese", "Liberian", "Libyan", "Liechtensteiner", "Lithuanian", "Luxembourger", "Macedonian", "Malagasy", "Malawian", "Malaysian", "Maldivan", "Malian", "Maltese", "Marshallese", "Mauritanian", "Mauritian", "Mexican", "Micronesian", "Moldovan", "Monacan", "Mongolian", "Moroccan", "Mosotho", "Motswana", "Mozambican", "Namibian", "Nauruan", "Nepalese", "New Zealander", "Nicaraguan", "Nigerian", "Nigerien", "North Korean", "Northern Irish", "Norwegian", "Omani", "Pakistani", "Palauan", "Panamanian", "Papua New Guinean", "Paraguayan", "Peruvian", "Polish", "Portuguese", "Qatari", "Romanian", "Russian", "Rwandan", "Saint Lucian", "Salvadoran", "Samoan", "San Marinese", "Sao Tomean", "Saudi", "Scottish", "Senegalese", "Serbian", "Seychellois", "Sierra Leonean", "Singaporean", "Slovakian", "Slovenian", "Solomon Islander", "Somali", "South African", "South Korean", "Spanish", "Sri Lankan", "Sudanese", "Surinamer", "Swazi", "Swedish", "Swiss", "Syrian", "Taiwanese", "Tajik", "Tanzanian", "Thai", "Togolese", "Tongan", "Trinidadian/Tobagonian", "Tunisian", "Turkish", "Tuvaluan", "Ugandan", "Ukrainian", "Uruguayan", "Uzbekistani", "Venezuelan", "Vietnamese", "Welsh", "Yemenite", "Zambian", "Zimbabwean"]
    }
}

//5 A simple algorithm that return fibonacci numbers below for a specific integer
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

//6 A simple algorithm that return a truncated string with a specified length
extension String {
    func truncate(length: Int, trailing: String = "") -> String {
        if self.count > length {
            return String(self.prefix(length)) + trailing
        } else {
            return self
        }
    }
}
//7 Simple algorithm equivalent to the between Numbers challenge from HackerRank
func getTotalX(a: [Int], b: [Int]) -> Int {
    var intersa = [Int]()
    var intersb = [Int]()
    var inters = [Int]()
    var indexa = 1
    var indexb = 1
    let range = a.min()!...b.max()!
    var finalb = [Int]()
    var finala = [Int]()
    
    if (0...10).contains(a.count) && (0...10).contains(b.count) {
        
        for number in a {
            for element in range {
                if element.isMultiple(of:number) && element.isMultiple(of: a[indexa]) {
                    intersa.append(element)
                    if indexa < a.count - 1 { indexa += 1 }
                }
            }
        }
        let mappedItema = intersa.map { ($0, 1) }
        let counta = Dictionary(mappedItema, uniquingKeysWith: +)
        for (key, value) in counta {
            if value >= a.count {
                finala.append(key)
            }
        }
        
        for n in b {
            for e in finala {
                indexb  = b.count - 1
                if n % e == 0 && indexb < b.count {
                    if b[indexb] % e == 0 {
                        intersb.append(e)
                        indexb -= 1
                    }
                }
            }
        }
        
        let mappedItemb = intersb.map { ($0, 1) }
        let countb = Dictionary(mappedItemb, uniquingKeysWith: +)
        for (key, value) in countb {
            if value >= b.count { finalb.append(key) }
        }
        inters = finala.filter(finalb.contains)
    }
    return inters.count
    
}

// From HackerRank

//1 Simple algorithm for the students grades  challenge
func gradingStudents(arrays:[Int]) -> [Int] {
    var arr = [Int]()
    
    if 1 <= arrays.count && arrays.count <= 60 {
        let interval = 0...100
        for n in arrays {
            for inter in interval {
                if inter % 5 == 0 && inter > n && inter - n < 3 {
                    if 0 <= n && n <= 100 {
                        if n < 38 {
                            arr.append(n)
                        } else  {
                            arr.append(inter)
                        }
                    }
                } else if inter % 5 == 0 && inter > n && inter - n == 3 {
                    arr.append(n)
                }
            }
        }
    }
    return arr
}
//2 Simple algorithm for counting valleys challenge
func countingValleys(n:Int, str:String) -> Int{
    let upperStr = str.uppercased()
    var Us = 0
    var Ds = 0
    var valleys = 0
    let array = Array(upperStr)
    if 2 <= n && n <= Int(powf(10, 6)){
        for i in array {
            if i == "U" {
                Us += 1
            } else if i == "D" {
                Ds += 1
            }
            if array[0] == array[array.count-1] {
            }
        }
    }
    valleys  = Ds + Us
    return valleys / n
}
//3 Simple algorithm for between Numbers challenge
func betweenNumbers(of first: [Int], and second: [Int]) -> Int {
    
    func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
        
        var result: (a: Int, b: Int, d: Int) = (a, b, 0)
        
        while (result.a % 2 == 0) && (result.b % 2 == 0) {
            result = (result.a / 2, result.b / 2, result.d + 1)
        }
        while (result.a != result.b) {
            if (result.a % 2 == 0) { result.a = result.a / 2 }
            else if (result.b % 2 == 0) { result.b = result.b / 2 }
            else if result.a > result.b { result.a = (result.a - result.b) / 2 }
            else { result.b = (result.b - result.a) / 2 }
        }
        return result.a * Int(pow(2.0, Double(result.d)))
    }
    
    func greatestCommonDivisor(_ array: [Int]) -> Int {
        var result: Int = array[0]
        for integer in array {
            result = greatestCommonDivisor(result, integer)
        }
        return result
    }
    
    func leastCommonMultiple(_ a: Int, _ b: Int) -> Int {
        return (a * b)/greatestCommonDivisor(a, b)
    }
    
    func leastCommonMultiple(_ array: [Int]) -> Int {
        var result: Int = array[0]
        for integer in array {
            result = (result * integer)/greatestCommonDivisor(result, integer)
        }
        return result
    }
    
    let LCM = leastCommonMultiple(first)
    let GCD = greatestCommonDivisor(second)
    var result: [Int] = []
    if LCM <= GCD{
        for n in 1...GCD/LCM {
            if GCD % (LCM * n) == 0{
                result.append(LCM * n)
            }
        }
    }
    let number = result.count
    return number
}



// SoloLearn {
//1 A simple algorithm for password validator
func validatePassword(password: String) -> Bool {
    
    let datas = Array(password)
    var count = 0
    var number = 0
    if datas.count >= 7 {
        for data in datas {
            let char = String(data)
            if char >= "0" && char <= "9" {
                number += 1
            } else if char == "!" || char == "@" || char == "#" || char == "$" || char == "%" || char == "&" || char == "*" {
                count += 1
            }
        }
    }
    if number >= 2 && count >= 2 {
        return true
    } else {
        return false
    }
}
//2 To transform the format of dates
let dateString = "November 02, 2019"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM/d/yyyy"
let date = dateFormatter.date(from: dateString)
dateFormatter.dateFormat = "d/M/yyyy"
let Date24 = dateFormatter.string(from: date!)
print("24 hour formatted Date:",Date24)

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
// Take a string and return a transformed string using ROT13
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



// This method returned A string with the first letter capitalized
extension String {
    
    
    func firstLetterCapitalized() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    mutating func firstLetterCapitalized() {
        self = self.firstLetterCapitalized()
    }
    
}

// Add  decimal format to a integer
extension Int {
    var withComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: self)) else {
            fatalError("Unable to format this number into a decimal format")
        }
        return formattedNumber
    }
}



// Get an Array of all Emojis
extension Array {
    var emojis: [String] {
        var emojis = [String]()
        for i in 0x1F600...0x1F64F {
            let emoji = String(UnicodeScalar(i) ?? "-")
            emojis.append(emoji)
        }
        return emojis
    }
}


// Convert Html to normal string
extension String {
    var html2String: String {
        guard let data = data(using: .utf8), let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil) else {
            return self
        }
        return attributedString.string
    }
}


// Handle User TextView
class TextViewController: UIViewController {
    
    var textView: UITextView!
    /// Note: you should start  by adding these two Notificationsin viewDiidLoad()
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateTextView(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateTextView(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Update the textView (bottom ContenInset,  scrollIndicatorInsets and scrollRangeToVisible) according to the KeyBoard Frame
    @objc func updateTextView(notification: Notification) {
        let userInfo = notification.userInfo!
        let keyboardFrameCoordinates = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyBoardFrame = self.view.convert(keyboardFrameCoordinates, to: self.view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            self.textView.contentInset = .zero
        } else {
            self.textView.contentInset.bottom = keyBoardFrame.height
            self.textView.scrollIndicatorInsets = textView.contentInset
        }
        self.textView.scrollRangeToVisible(self.textView.selectedRange)
    }
}

// Currency TextField
class CurrencyViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var currencyField: UITextField!
    var amount = 0
    lazy var numberFormatter: NumberFormatter = {
        let formatter  = NumberFormatter()
        formatter.numberStyle = .currency
        
        formatter.currencySymbol = "RWF"
        
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.currencyField.delegate = self
        self.currencyField.placeholder  = self.updateCurrencyField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    func updateCurrencyField() -> String? {
        let number = Double(amount/100) + Double(amount%100)/100
        
        return self.numberFormatter.string(from: NSNumber(value: number))
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let digit = Int(string) {
            amount = amount * 10 + digit
            
            currencyField.text = updateCurrencyField()
        }
        
        if amount > 1_000_000_000_00 {
            let alert = UIAlertController(title: "Please enter a value less than 1 Billion", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (action) in
                self.amount = 0
                self.currencyField.text = ""
            }))
            
            present(alert, animated: true, completion: nil)
        } else {
            currencyField.text = updateCurrencyField()
        }
        
        if string == "" {
            amount /= 10
            currencyField.text = amount == 0 ? "" : updateCurrencyField()
        }
        return false
    }
}
