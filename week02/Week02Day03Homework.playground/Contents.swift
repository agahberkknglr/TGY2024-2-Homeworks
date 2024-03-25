
import UIKit
/*
 @author: Agah Berkin Guler
 */


/*
 Keyboard hide extension yazınız
 Internal, private, file private, public, open (Mülakat sorusu)
 Segmented control, datepicker, picker,
 Euler 8-9-10
 Exercism 10 tane
 */

// euler 8 - Largest Product in a Series

var series: [String] = ["7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"]
var digits = [Int]()
for string in series {
    for char in string {
        if char.isNumber {
            let digit = Int(String(char))!
            digits.append(digit)
        }
    }
}

func product(of subarray: [Int]) -> Int {
    var result = 1
    for num in subarray {
        result *= num
    }
    return result
}


var maxProduct = 0

for i in 0..<digits.count - 12 {
    let subArray = Array(digits[i..<i+13])
    let currentProduct = product(of: subArray)
    maxProduct = max(maxProduct, currentProduct)
}

print(maxProduct)

// euler 9 - Special Pythagorean Triplet

let sum = 1000

func triplet(sum: Int) -> (a:Int, b:Int, c:Int)?{
    for a in 1..<sum {
        for b in a + 1..<sum {
            var c = sum - a - b
            if a * a + b * b == c * c {
                return (a,b,c)
            }
        }
    }
    return nil
}

//triplet(sum: sum)

// euler 10 - Summation of Primes
let limit2 = 2_000_000

func sumOfPrimes(limit: Int) -> Int {
    var isPrime = [Bool](repeating: true, count: limit + 1)
    var sum = 0
    
    for p in 2...limit {
        if isPrime[p] {
            sum += p
            var multiple = p * p
            while multiple <= limit {
                isPrime[multiple] = false
                multiple += p
            }
        }
    }
    return sum
}

//let sum2 = sumOfPrimes(limit: limit2)
//print(sum2)

//exercism 1-10

//scrabble score

func score(_ phrase: String) -> Int {
    let letterString = "aeioulnrstdgbcmpfhvwykjxqz"
    let letterValue = [1,1,1,1,1,1,1,1,1,1,
                        2,2,
                        3,3,3,3,
                        4,4,4,4,4,
                        5,
                        8,8,
                        10,10]
    
    var sum = 0
    for char in phrase.lowercased() {
        var index = letterString.distance(from: letterString.startIndex, to: letterString.firstIndex(of: char)!)
        var point = letterValue[index]
        sum += point
    }
    return sum
}
score("cabbage")

//secret double agent

func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
  
  func checkPassword(pw:String) -> String {
    guard pw == password else {return "Sorry. No hidden secrets here."}

    return secret
  }

  return checkPassword
}

func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {

  let (first, second, third) = ( f(room), f(f(room)), f(f(f(room))) )

  return (first, second, third)
}

// sum of multiples

func toLimit(_ limit: Int, inMultiples: Set<Int>) -> Int {
    var multiples: Set = [0]
    for eachNum in inMultiples.filter({$0 > 0}) {
        multiples = multiples.union(stride(from: eachNum, to: limit, by: eachNum))
    }
    return multiples.reduce(0, +)
}

//letter diamon g

struct Diamond {
    static func makeDiamond(letter: Character) -> [String] {
        let offset = Character("A").asciiValue!
        let characterCount = Int(letter.asciiValue! - offset) + 1
        let dimension = characterCount * 2 - 1
        let middle = characterCount - 1
        
        var result = Array(repeating: String(repeating: " ", count: dimension), count: characterCount)
        for i in 0..<characterCount {
            let currentCharacter = String(Character(UnicodeScalar(UInt8(i) + offset)))
            let leftIndex = result[i].index(result[i].startIndex, offsetBy: middle - i)
            let rightIndex = result[i].index(result[i].startIndex, offsetBy: middle + i)
            result[i].replaceSubrange(leftIndex...leftIndex, with: currentCharacter)
            result[i].replaceSubrange(rightIndex...rightIndex, with: currentCharacter)
        }
        
        result.append(contentsOf: result.reversed().dropFirst())
        
        return result
    }
}

//pythagorean triplet

func tripletsWithSum(_ sum: Int) -> [[Int]] {
    var triplets: [[Int]] = []
     for a in 1..<sum {
        for b in a + 1..<sum {
            var c = sum - a - b
            if a * a + b * b == c * c {
                triplets.append([a, b, c])
            }
        }
    }
    return triplets
}

// vehicle purchase
func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    var montlyPrice = price/60
    if montlyPrice <= monthlyBudget {
        return "Yes! I'm getting a \(vehicle)"
    }
    if montlyPrice <= monthlyBudget * 1.1 {
        return "I'll have to be frugal if I want a \(vehicle)"
    } else {
        return "Darn! No \(vehicle) for me"
    }
    
}

func licenseType(numberOfWheels wheels: Int) -> String {
    if wheels == 2 || wheels == 3 {
        return "You will need a motorcycle license for your vehicle"
    } else if wheels == 4 || wheels == 6 {
        return "You will need an automobile license for your vehicle"
    } else if wheels == 18 {
        return "You will need a commercial trucking license for your vehicle"
    } else {
        return "We do not issue licenses for those types of vehicles"
    }
}

func calculateResellPrice(originalPrice: Int, yearsOld: Int) -> Int {
    var newPrice = originalPrice
    if yearsOld < 3 {
        return Int(Double(newPrice) * 0.8)
    } else if yearsOld < 10 {
        return Int(Double(newPrice) * 0.7)
    } else {
        return Int(Double(newPrice) * 0.5)
    }
}
// gigasecond

func gigasecond(from: Date) -> Date {
  from + 1_000_000_000
}

// leap year

struct Year {
    let calendarYear: Int
    
    var isLeapYear: Bool {
        return calendarYear % 4 == 0 && (calendarYear % 100 != 0 || calendarYear % 400 == 0)

    }
}

//rna transcription
func toRna(_ dna: String) -> String {
  // Write your code for the 'Rna Transcription' exercise in this file.
    let dnaa = "ACGT"
    let rnaa = "UGCA"
    var dnaToRna = ""
    for nucleotide in dna {
        if let index = dnaa.firstIndex(of: nucleotide) {
                    dnaToRna.append(rnaa[index])
        }
    }
    return dnaToRna
}

//  accumulate
extension Array {
    func accumulate<T>(_ operation: (Element) -> T) -> [T] {
        return self.map(operation)
    }
        
}



//..

