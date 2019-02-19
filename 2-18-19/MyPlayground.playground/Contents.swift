import UIKit


//switch statements
var grade: Int = 95
var letter: String

switch grade {
case 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100:
    letter = "You get an A."
case 80...89:
    letter = "You get a B."
default:
    letter = "Incomplete"
}

//let is a constant
let age = 25
switch age {
case 21...151:
    print("of legal age. Age is \(age)")
default:
    break
}

//optionals
/*
var errorCodeString: String?
errorCodeString = "404"
print(errorCodeString)
errorCodeString!
 */


var errorCodeString: String?
errorCodeString = "404"

if errorCodeString != nil {
    let theError = errorCodeString!
    print(theError)
}
else {
    print("Unwrap the error")
}



//Arrays
var bucketList: [String]

bucketList = ["Skydiving","Travel the world in 81 days","Go to the Superbowl","Win the lottery","Solve a rubix cube","Learn another language","Get an A in Professor Roedel's Class"]

bucketList.count

    //Can only append one item at a time
bucketList.append("Open a restaurant")
bucketList.append("Buy a phantom car")

//Removes "Get an A in Professor Roedel's Class
bucketList.remove(at: 6)

print(bucketList[2...3])

bucketList[0] += " in Australia"

print(bucketList[0])

var newItems = ["one", "two", "three", "six", "twelve", "nine"]

//item is temporary variable    for i=0; i<newItems.count; i++ { var item: String; item = newItems[i]; bucketListAppend(
for item in newItems {
    bucketList.append(item)
}

print(bucketList)

bucketList.insert("graduate", at: 2)

bucketList.remove(at: 3)



//Dictionaries
var movieRatings = ["Avengers": 4, "Jaws": 4, "Star Wars": 5, "Equilizer": 4, "Black Panther": 4]

let jawsRating = movieRatings["Jaws"]

movieRatings["Jaws"] = 5

movieRatings.removeValue(forKey: "Avengers")

movieRatings


//Enumerations create your own types
enum TextAlignment {
    case left
    case right
    case center
    case justify
}

var alignment: TextAlignment
alignment = TextAlignment.left

if alignment == .right {
    print("alignment is right justified")
}

switch alignment {
case .left:
    print("left aligned")
case .right:
    print("right aligned")
default:
    print("centered")
}
