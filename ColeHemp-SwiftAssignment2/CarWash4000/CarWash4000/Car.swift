//
//  Car.swift
//  CarWash4000
//
//  Created by student on 4/8/19.
//  Copyright © 2019 ColeHemp. All rights reserved.
//

import UIKit

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
    
    func setYear(year: Int) {
        self.year = year
    }
    func updateYear() {
        year += 1
    }
}
