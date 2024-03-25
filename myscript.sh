#!/usr/bin/env swift
//print("Hello, swift!")
import Foundation

//var users = ["feyyaz", "suleyman", "baris", "merve", "dogukan"]

/*if users.contains(""){
	print("Empty name error")
} else {
	for user in users {
	print(user.capitalized)
	}
}*/

print("Enter your name: ")
var name = readLine(strippingNewline: true)
print("Hello \(name ?? "John doe")")
