import UIKit
/*
 @author: Agah berkin Guler
 */


// Fonksiyona parametre olarak verilen sayıya göre + - karakterlerini ekrana yazdıran bir fonksiyon yaınız. Örneğin 1 için sadece +, 2 için +-, 5 için +-+-+ şeklinde olmalıdır

func signs(number: Int){
    var output = ""
    for i in 1...number {
        if i%2 == 1 {
            output.append("+")
        }else {
            output.append("-")
        }
    }
    print(output)
}
signs(number: 5)

//  Fonksiyona parametre olarak verilen sayıyı en büyük yapacak şekilde 5 sayısını yanına koyunuz. Örneğin parametre 0 için çıktı 50 olmalıdır. Parametre 28 için 528, parametre 920 için 9520 olmalıdır

func addFive(number: Int) -> Int{
    var strNumber = String(number)
    strNumber += "5"
    var result = ""
    for char in strNumber.sorted(by: >){
        result += String(char)
    }
    let resultInt = Int(result)!
    return resultInt
}

addFive(number: 0)
addFive(number: 920)
