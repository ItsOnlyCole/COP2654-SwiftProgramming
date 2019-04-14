//
//  Package.swift
//  CarWash4000
//
//  Created by Cole Hemp on 4/14/19.
//  Copyright © 2019 ColeHemp. All rights reserved.
//

import UIKit

class Package {
    //Variables for Selected Package Options
    private var name: String = ""
    private var cost: Double = 0.00
    private var soap: String = ""
    private var coatsOfWax: Int = 0
    private var specialtyCarSurcharge: Bool = false
    private var specialtyCarSurchargePrice: Double = 0.00
    
    private let packageNames: [String] = ["Basic", "Not So Basic", "I'm Moving Up", "Make It Rain", "Midas's Touch"]
    private let packagePrices: [Double] = [10.00, 15.00, 20.00, 25.00, 30.00]
    private let packageSoaps: [String] = ["Yellow", "Green", "Blue", "Red", "Purple"]
    private let packageCoatsOfWax: [Int] = [0, 0, 0, 1, 2]
    private let specialtyCarSurchargeRequirements: [String:Bool] = ["Sedan":false, "Sports":true, "SUV":true, "Truck":false ]
    private let specialtyCarSurchargePrices: [String:Double] = ["Sedan":0.00, "Sports":20.00, "SUV":10.00, "Truck":0.00]
    
    //Default Constructor
    init() {
        //Sets packages to basic.
        name = packageNames[0]
        cost = packagePrices[0]
        soap = packageSoaps[0]
        coatsOfWax = packageCoatsOfWax[0]
    }
    
    //Accessors & Mutators
    func setPackage(packageNumber:Int)
    {
        name = packageNames[packageNumber]
        cost = packagePrices[packageNumber]
        soap = packageSoaps[packageNumber]
        coatsOfWax = packageCoatsOfWax[packageNumber]
    }
    func setSpecialtyCarSurcharge(carType:String)
    {
        specialtyCarSurcharge = specialtyCarSurchargeRequirements[carType]!
        specialtyCarSurchargePrice = specialtyCarSurchargePrices[carType]!
    }
    func getName() -> String { return name }
    func getCost() -> Double { return cost }
    func getSoap() -> String { return soap }
    func getCoatsOfWax() -> Int { return coatsOfWax }
    func getSpecialtyCarSurcharge() -> Bool { return specialtyCarSurcharge }
    func getSpecialtyCarSurchargePrice() -> Double { return specialtyCarSurchargePrice }
    
    //Custom Functions
    func checkForWax(remainingWax:Int) -> Bool
    {
        if(coatsOfWax == 0)
        {
            //Don't show wax label
            return false
        }
        else if (coatsOfWax > remainingWax)
        {
            //Not enough Wax left for package
            //Removes $2 from price for lack of wax
            cost = cost - (Double)(2 * coatsOfWax)
            return false
        }
        else
        {
            //Enables wax label if there's enough remaining wax for the package
            return true
        }
    }
    
}
