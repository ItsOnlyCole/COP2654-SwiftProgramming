/*
car.swift
Created by Cole Hemp
COP 2654
*/

struct Car {
  var model: String
  var year: Int
  var color: String
  var numOfWheels: Int

  func getDescription() {
    print("Car Model: \(model)")
    print("Year: \(year)")
    print("Color: \(color)")
    print("numOfWheels: \(numOfWheels)")
  }

  func setYear(newYear: Int) {
    year = newYear
  }
  func updateYear() {
    year += 1
  }
}