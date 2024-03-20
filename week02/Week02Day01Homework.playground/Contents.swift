import UIKit


// 2 parametreli ve farkkli tipli bir generic ornegi yapiniz (T,U)

struct car<T, U> {
    var brand: T
    var year: U
    
    init(brand: T, year: U) {
        self.brand = brand
        self.year = year
    }
}

let car1 = car(brand: "nissan", year: 2002)
let car2 = car(brand: "mazda", year: 2005)


//euler 7

func findingPrimes(k: Int) -> Int {
    var primes = [Int]()
    var number = 2
    
    while primes.count < k {
        var isPrime = true
        
        for prime in primes {
            if number % prime == 0 {
                isPrime = false
                break
            }
        }
        
        if isPrime {
            primes.append(number)
        }
        number += 1
    }
    return primes.last ?? -1
}

let x = 6
findingPrimes(k: x)
let y = 10001
findingPrimes(k: y)


//exercism 1-5
//Hello world -1

func hello() -> String {
  return "Hello, World!"
}
func hello(x: String) -> String {
    return "Hellp \(x)"
}

//Layers of Lasagna -2
// TODO: define the 'expectedMinutesInOven' constant
let expectedMinutesInOven = 40
// TODO: define the 'remainingMinutesInOven' function
func remainingMinutesInOven(elapsedMinutes: Int) -> Int
 {
  return expectedMinutesInOven - elapsedMinutes
 }
// TODO: define the 'preparationTimeInMinutes' function
func preparationTimeInMinutes(layers: Int) -> Int{
    return layers * 2
}
// TODO: define the 'totalTimeInMinutes' function
func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int{
    return preparationTimeInMinutes(layers: layers) + elapsedMinutes
}

//Wings Quest -3
func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
    return powerUpActive && touchingEagle
}
//bonusPoints(powerUpActive: false, touchingEagel: true)

func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
  return touchingPowerUp || touchingSeed
}

//score(touchingPowerUp: true, touchingSeed: true)

func lose(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
    return !powerUpActive && touchingEagle
}

//lose(powerUpActive: false, touchingEagle: true)

func win(hasPickedUpAllSeeds: Bool, powerUpActive: Bool, touchingEagle: Bool) -> Bool {
    return hasPickedUpAllSeeds && !lose(powerUpActive: powerUpActive, touchingEagle: touchingEagle)
}

//win (hasPickedUpAllSeeds: false, powerUpActive: true, touchingEagle: false)

//Freelancer Rates -4

func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(hourlyRate) * 8.0
}
func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let workdaysInMonth = 22
    let dailyRate = dailyRateFrom(hourlyRate:hourlyRate)
    let monthlyRateWithoutDiscount = dailyRate * Double(workdaysInMonth)
    let monthlyRateWithDiscount = monthlyRateWithoutDiscount * ( 1 - discount/100)
    return monthlyRateWithDiscount.rounded(.toNearestOrAwayFromZero)
}
func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
     return (budget / (dailyRateFrom(hourlyRate: hourlyRate)*(1.0 - discount/100.0))).rounded(.towardZero)
}

//Custom Signs -5
let birthday = "Birthday"
let valentine = "Valentine's Day"
let anniversary = "Anniversary"
let space: Character = " "
let exclamation: Character = "!"

func buildSign(for occasion: String, name: String) -> String {
    let space = " "
    let exclamation = "!"

    return "Happy \(occasion)\(space)\(name)\(exclamation)"
}

func graduationFor(name: String, year: Int) -> String {
    return "Congratulations \(name)!\nClass of \(year)"
}

func costOf(sign: String) -> Int {
    return 20 + (sign.count * 2)
}

//Two Fer -6
func twoFer(name: String? = nil) -> String{
    if let name = name {
        return "One for \(name), one for me."
    }else {
        return "One for you, one for me."
    }
}
twoFer()

//difference-of-squares -7
class Squares {
    // Write your code for the 'Difference Of Squares' exercise here.

    let number: Int
    
    init(_ number: Int) {
        self.number = number
    }
    
    var squareOfSum: Int {
        let sum = (number * (number + 1)) / 2
        return sum * sum
    }
    
    var sumOfSquares: Int {
        return (number * (number + 1) * (2 * number + 1)) / 6
    }
    
    var differenceOfSquares: Int {
        return squareOfSum - sumOfSquares
    }
}

//isogram -8
func isIsogram(_ string: String) -> Bool {
    var seen = Set<Character>()
    
    for letter in string.lowercased() {
        if letter != " " && letter != "-" {
            if seen.contains(letter) {
                return false
            }else {
                seen.insert(letter)
            }
        }
    }
    return true
}

// reverse String -9
func reverseString(_ input : String) -> String {
    // Write your code for the 'Reverse String' exercise in this file.
    let reversedStr = input.reversed()
    return String(reversedStr)
}

reverseString("abcdfg")

//space age
class SpaceAge {
    let seconds: Double
    private let earthYearInSeconds: Double = 31557600
    
    init(_ seconds: Double) {
        self.seconds = seconds
    }
    
    var onEarth: Double {
        return calculateAge(onPlanet: "Earth")
    }
    
    var onMercury: Double {
        return calculateAge(onPlanet: "Mercury")
    }
    
    var onVenus: Double {
        return calculateAge(onPlanet: "Venus")
    }
    
    var onMars: Double {
        return calculateAge(onPlanet: "Mars")
    }
    
    var onJupiter: Double {
        return calculateAge(onPlanet: "Jupiter")
    }
    
    var onSaturn: Double {
        return calculateAge(onPlanet: "Saturn")
    }
    
    var onUranus: Double {
        return calculateAge(onPlanet: "Uranus")
    }
    
    var onNeptune: Double {
        return calculateAge(onPlanet: "Neptune")
    }
    
    private func calculateAge(onPlanet planet: String) -> Double {
        let orbitalPeriods: [String: Double] = [
            "Mercury": 0.2408467,
            "Venus": 0.61519726,
            "Earth": 1.0,
            "Mars": 1.8808158,
            "Jupiter": 11.862615,
            "Saturn": 29.447498,
            "Uranus": 84.016846,
            "Neptune": 164.79132
        ]
        
        if let ratio = orbitalPeriods[planet] {
            return seconds / (ratio * earthYearInSeconds)
        } else {
            fatalError("Invalid planet")
        }
    }
}



