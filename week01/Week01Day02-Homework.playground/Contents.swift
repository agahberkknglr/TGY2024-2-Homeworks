import UIKit

/*
 @author: Agah Berkin Guler
 */

// Euler project 4: Largest palindrome product

var firstElement = 0
var secondElement = 0
var solution = 0

for i in 100...999 {
    for j in 100...999{
        let multiplication = i * j
        let stringMult = String(multiplication)
        let reversedStringMult = String(stringMult.reversed())
        
        if stringMult == reversedStringMult && multiplication > solution {
            solution = multiplication
            firstElement = i
            secondElement = j
        }
    }
}

print("The biggest palindrome number for \(firstElement) * \(secondElement) = \(solution)")


// Euler project 5: What is the smallest positive number that is evenly divisible by all of the number from 1 to 20
 
//least common multiple
func lcm(a: Int, b:Int) -> Int{
    return a * b / gcd(a: a, b: b)
}
//gcd greatest common divisor
func gcd(a: Int, b:Int) -> Int{
    if b == 0{
        return a
    }
    return gcd(a: b, b: a % b)
}
var lcm = 1
for i in 2...20 {
    lcm = lcm(a: lcm, b: i)
}
print("Lcm of 1 to 20: \(lcm)")




// Euler project 6: Sum square difference

var sumOfTheSquares = 0

var squareOfTheSum = 0



for i in 1...100 {
    
    squareOfTheSum += i
    
    
    sumOfTheSquares += i * i
}
squareOfTheSum = squareOfTheSum * squareOfTheSum
print("Square of the sum is : \(squareOfTheSum)")
print("Sum of the Square is : \(sumOfTheSquares)")
var differences = squareOfTheSum - sumOfTheSquares

print("The differences is \(differences)")


// Bir sinifta en az bir yazilim dilini bilenlerin sayisi 24 sadece swift bilenlerin 12 sadeece kotlin bilenler 8 her iki dilenlerin sayisi kactir
// 24 - (12 + 8)  = 4
