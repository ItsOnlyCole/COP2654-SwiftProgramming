/*
theCarWash3000.swift
Created by: Cole Hemp
COP2654-Swift
*/

var active: Bool = false
var counter: Int = 0
var user: String = "Cole"
var carModel: String
var carHistory: [String] = ["sedan", "truck", "suv"]
var price: Double = 0.00
var soap: String
var remainingWax = 10
var waxCar: String = "n"

let washOptions: [Int:String] =
  [
    1:"basic",
    2:"not so basic",
    3:"I'm moving up",
    4:"make it rain",
    5:"Midas Touch",
  ]
let washOptionsSoaps: [Int:String] = [1:"yellow", 2:"green", 3:"blue", 4:"red", 5:"purple"]
let washOptionsPrices: [Int:Double] = [1:10.00, 2:15.00, 3:20.00, 4:25.00, 5:30.00]
//Option:Wax Amount
let washOptionsWax: [Int:Int] = [1:0, 2:0, 3:0, 4:1, 5:2]


//A function can be placed here to activate the CarWash3000.
active = true


//CarWash3000 starts
while(active == true)
{
  //prints welcome statement, increases counter, and deactivates trigger
  print("Welcome \(user) to The CarWash 3000!")
  counter += 1
  active = false
  //sets the carModel for the car that just entered
  carModel = "sports"




  //Prints out the options and prices
  for i in 1...5
  {
    print("Option \(i): The \(washOptions[i]!) - $\(washOptionsPrices[i]!)")
  }

  //Notifies user of surcharge for SUV and Sports Cars
  print("\nPlease note that there is a surcharge of:\n$10 for SUVs\n$20 for Sports Cars")

  //gets the user's option
  print("\nSelect Option: ")
  let userSelection = Int(readLine()!)

  price += washOptionsPrices[userSelection!]!

  //prints out option selected and price
  //Couldn't find a way to format a double to show two decimal places. Adding a 0 at the end is my temporary work-around.
  print("\nThe \(washOptions[userSelection!]!): $\(washOptionsPrices[userSelection!]!)0")

  if carModel == "suv"
  {
    price += 10.00
    print("\nSUV Surcharge: +$10.00")
  }
  else if carModel == "sports"
  {
    price += 20.00
    print("\nSports Car Surcharge: +$20.00")
  }

  if washOptionsWax[userSelection!]! != 0 && remainingWax != 0
  {
    print("\nYour car wash option allows for \(washOptionsWax[userSelection!]!) coats of wax for an extra $\(5.00 * Double(washOptionsWax[userSelection!]!))0")
    print("Would you like to add waxing to your car wash?(y/n)")
    waxCar = readLine()!

    if(waxCar == "y")
    {
      price += (5.00 * Double(washOptionsWax[userSelection!]!))
    }
  }
  else
  {
    print("\nNo Wax Option Present")
  }

  print("\nTotal Cost: $\(price)0")


  print("\n\nStarting Car Wash")

  soap = washOptionsSoaps[userSelection!]!
  print("\nSwitching to \(soap) soap.")

  print("\nWashing with soap: Complete")
  
  if(waxCar == "y")
  {
    print("\nWaxing Car")
    remainingWax -= washOptionsWax[userSelection!]!
    print("\nWaxing: Complete")
  }

  //Adds car that to history of cars that pass through the CarWash3000
  carHistory.append(carModel)

  print("\nCar Wash Complete!\nHave a good day!")
}




