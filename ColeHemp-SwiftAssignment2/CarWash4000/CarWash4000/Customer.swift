//
//  Customer.swift
//  CarWash4000
//
//  Created by student on 4/8/19.
//  Copyright © 2019 ColeHemp. All rights reserved.
//
import UIKit

class Customer {
    private var name: String = ""
    private var package: String = ""
    private var carType: String = ""
    //Move to Package.swift
    //private var specialtyCarTypeSurcharge: Bool = false
    //private var specialtyCarTypeSurchargePrice: Double = 0.00
    private var totalPrice: Double = 0.00
    
    
    //Default Constructor
    init () {
        //Does Nothing. All the attributes need to be manually set
    }
    //Overloaded Constructors
    init(name: String){
        self.name = name
    }
    init(name: String, carType: String)
    {
        self.name = name
        self.carType = carType
    }
    init(name: String, carType: String, package: String)
    {
        self.name = name
        self.carType = carType
        self.package = package
    }
    
    
    //Mutators & Accessors
    func setName(name:String){
        self.name = name
    }
    func getName() -> String {
        return name
    }
    func setPackage(package: String){
        self.package = package
    }
    func getPackage() -> String {
        return package
    }
    func setCarType(carType: String){
        self.carType = carType
    }
    func getCarType() -> String {
        return carType
    }
    func setTotalPrice(totalPrice: Double){
        self.totalPrice = totalPrice
    }
    func getTotalPrice() -> Double {
        return totalPrice
    }
}
