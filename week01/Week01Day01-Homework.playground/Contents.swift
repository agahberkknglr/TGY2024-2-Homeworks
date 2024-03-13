import UIKit
/*
 @author: Agah Berkin Guler
 @date: 13/03/2024
 */


// Answer 01:

func deleteChars(str: String, repetition: Int) -> String{
    var charDict = [Character: Int]()
    var finalString = str
    
    for chr in str {
        if chr.isLetter {
            charDict[chr, default: 0] += 1
        }
    }
    
    for (chr, count) in charDict {
        if count >= repetition {
            finalString = finalString.replacingOccurrences(of: String(chr), with: "")
        }
    }
    
    return finalString
    
}


deleteChars(str: "aaba kouq bux", repetition: 2)

// Answer 02:

func countWords(str: String) {
    let wordsArray = str.split(separator: " ")
    
    var wordDict = [Substring: Int]()
    for word in wordsArray {
        wordDict[word, default: 0] += 1
    }
    
    for (word, count) in wordDict {
        print("\(word) \(count) kere")
    }
}

countWords(str: "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim")

// Answer 03:


func capitalZA(str: String) {
    
    let wordsArray = str.split(separator: " ")
    var capitalizedArray: [String] = []
    
    for word in wordsArray {
        capitalizedArray.append(word.uppercased())
    }
    
    let sortedArray = capitalizedArray.sorted(by: >)
    
    print(sortedArray)
}

capitalZA(str: "Merhaba nasılsınız aiyiyim siz nasılsınız bende ziyiyim")


// Answer 04 - 01: Multiples of 3 or 5

var sum = 0

for i in 1...999 {
    if i % 3 == 0 || i % 5 == 0 {
        sum += i
    }
}
print(sum)

// Answer 04 - 02: Even Fibonacci Numbers

var fibonacciMemo: [Int: Int] = [:]

func fibonacci(x: Int) -> Int {
    if let cachedValue = fibonacciMemo[x] {
        return cachedValue
    }
    else {
    if x == 0 {
        return 1
    }
    else if x == 1 {
        return 1
    }
    else {
        let value = fibonacci(x: x - 2) + fibonacci(x: x - 1)
        fibonacciMemo[x] = value
        return value
    }
  }
}


func evenFibonacci() -> Int{
    var sum = 0
    var temp = 1
    var number = 0
    while true {
        number = fibonacci(x: temp)
        if number % 2 == 0 {
            sum += number
        }
        temp += 1
        
        if number >= 4_000_000 {
            break
        }
    }
    return sum
}

var y = evenFibonacci()
print(y)

// Answer 04 - 03: Largest Prime Factor


var number1 = 600_851_475_143
var number2 = 13_195

func largestPrime(n: Int) -> Int{
    var factors : [Int] = []
    
    var m = n
   
    while m % 2 == 0 {
        factors.append(2)
        m /= 2
    }
    var w = Int(sqrt(Double(m)))
    
    for i in 3...w {
        while m % i == 0{
            factors.append(i)
            m /= i
        }
    }
    
    if m > 2 {
        factors.append(m)
    }
    
    return factors.max() ?? 1
    
    
}

var z = largestPrime(n: number1)

print(z)
