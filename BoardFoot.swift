//
// BoardFoot.swift
//
// Created by Ketia Gaelle Kaze
// Created on 2022-3-1
// Version 1.0
// Copyright (c) Ketia Gaelle Kaze. All rights reserved.
//
// The BoardFoot program asks the user to
// enter the width and height and then accepts them as parameters and calculates the length of the board
// that can give a total volume of 144 inches^3.

// calculate length of board
func calculateBoardFoot(width: Double, height: Double) -> Double {
  let length = ONEBOARDFOOT / (width * height)

  return length
}

// exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that gives the exception
func catchString() throws {
    throw MyError.runtimeError("Enter a number!")
}

// declaring constants
let ONEBOARDFOOT = Double(144)

// declaring variables
var userWidthString: String
var userHeightString: String
var userWidthDouble: Double
var userHeightDouble: Double
var length: Double

// get width from user
print("Enter the width (inches): ", terminator: "")
userWidthString = readLine()!

do {
  userWidthDouble = Double(userWidthString) ?? 0
  if userWidthDouble != Double(userWidthString) {
    try catchString()
  }

  if userWidthDouble > 0 && userWidthDouble < 145 {
    // get height from user
    print("Enter the height (inches): ", terminator: "")
    userHeightString = readLine()!

    do {
      userHeightDouble = Double(userHeightString) ?? 0
      if userHeightDouble != Double(userHeightString) {
        try catchString()
      }

      if userHeightDouble > 0 && userHeightDouble < 145 {
        length = calculateBoardFoot(width: userWidthDouble, height: userHeightDouble)

        // display length to user
        print("The length has to be \(length) inch(es).")
      } else {
        print("Enter a positive number!")
      }
    } catch MyError.runtimeError(let errorMessage) {
      // catch invalid strings
      print(errorMessage)
      print()
    }
  } else {
    print("Enter a positive number!")
  }
} catch MyError.runtimeError(let errorMessage) {
  // catch invalid strings
  print(errorMessage)
}
