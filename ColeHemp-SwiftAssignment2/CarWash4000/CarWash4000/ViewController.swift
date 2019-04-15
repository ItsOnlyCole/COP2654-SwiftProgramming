//
//  ViewController.swift
//  CarWash4000
//
//  Created by student on 3/25/19.
//  Copyright © 2019 ColeHemp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var customer = Customer()
    var package = Package()
    var remainingWax: Int = 10
    
    @IBOutlet weak var numOfCarsWashedLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var packageCostLabel: UILabel!
    @IBOutlet weak var soapColorLabel: UILabel!
    @IBOutlet weak var coatsOfWaxLabel: UILabel!
    @IBOutlet weak var numCoatsOfWaxLabel: UILabel!
    @IBOutlet weak var vehicleTypeLabel: UILabel!
    @IBOutlet weak var specialtyCarSurchargeLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("App Started <3")
        
        //Sets package to basic package
        package.setPackage(packageNumber: 0)
        
        updatePackageCostLabel(packageCostLabel)
        updatePrice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getNameChange(_ nameTextBox: UITextField)
    {
        customer.setName(name: nameTextBox.text!)
        //print("\(nameTextBox.text!)")
    }
    
    @IBAction func finalizeNameChange(_ sender: UITextField)
    {
        welcomeLabel.text = "Welcome \(customer.getName)!"
    }
    
    @IBAction func updatePackage(_ sender: UISlider)
    {
        let packageNumber:Int = (Int)(sender.value)
        package.setPackage(packageNumber: packageNumber)
        customer.setPackage(package: package.getName())
        updatePackageCostLabel(packageCostLabel)
        updateSoap(soapColorLabel)
        updateCoatsOfWax(numCoatsOfWaxLabel, coatsOfWaxLabel)
        updatePrice()
        
    }
    
    //Update Functions that activate when package is changed.
    func updatePackageCostLabel(_ packageCostLabel: UILabel)
    {
        packageCostLabel.text = "\(package.getName()):$\(package.getCost())"
    }
    func updateSoap(_ soapColorLabel: UILabel)
    {
        soapColorLabel.backgroundColor = package.getSoap()
    }
    func updateCoatsOfWax(_ numCoatsOfWaxLabel: UILabel,_ coatsOfWaxLabel: UILabel)
    {
        numCoatsOfWaxLabel.text = "\(package.getCoatsOfWax())"
        coatsOfWaxLabel.isHidden = package.checkForWax(remainingWax: remainingWax)
        numCoatsOfWaxLabel.isHidden = package.checkForWax(remainingWax: remainingWax)
    }
    
    //Update vehicleType & Surcharge functions
    func updateVehicleTypeLabel(_ vehicleTypeLabel: UILabel)
    {
        vehicleTypeLabel.text = customer.getCarType()
        if(vehicleTypeLabel.text != "Vehicle type")
        {
            vehicleTypeLabel.isHidden=false
        }
    }
    func setSpecialtyCarSurcharge(_ specialtyCarSurchargeLabel: UILabel)
    {
        package.setSpecialtyCarSurcharge(carType: customer.getCarType())
        if(package.getSpecialtyCarSurcharge() == true)
        {
            specialtyCarSurchargeLabel.text = "Specilty Vehicle Surcharge: $\(package.getSpecialtyCarSurchargePrice())"
            specialtyCarSurchargeLabel.isHidden = false
        }
        else
        {
            specialtyCarSurchargeLabel.isHidden = true
        }
    }
    @IBAction func setVehicleToSedan(_ sender: UIButton)
    {
        customer.setCarType(carType: "Sedan")
        updateVehicleTypeLabel(vehicleTypeLabel)
        setSpecialtyCarSurcharge(specialtyCarSurchargeLabel)
        updatePrice()
    }
    @IBAction func setVehicleToSports(_ sender: UIButton)
    {
        customer.setCarType(carType: "Sports")
        updateVehicleTypeLabel(vehicleTypeLabel)
        setSpecialtyCarSurcharge(specialtyCarSurchargeLabel)
        updatePrice()
    }
    @IBAction func setVehicleToSUV(_ sender: UIButton)
    {
        customer.setCarType(carType: "SUV")
        updateVehicleTypeLabel(vehicleTypeLabel)
        setSpecialtyCarSurcharge(specialtyCarSurchargeLabel)
        updatePrice()
    }
    @IBAction func setVehicleToTruck(_ sender: UIButton)
    {
        customer.setCarType(carType: "Truck")
        updateVehicleTypeLabel(vehicleTypeLabel)
        setSpecialtyCarSurcharge(specialtyCarSurchargeLabel)
        updatePrice()
    }
    
    
    
    //Misc Functions
    func updatePrice()
    {
        let price: Double = package.getCost() + package.getSpecialtyCarSurchargePrice()
        customer.setTotalPrice(totalPrice: price)
        totalPriceLabel.text = "$\(customer.getTotalPrice())"
    }
    func resetWash()
    {
        customer.setName(name: "")
        
        
    }
    
    
    
    

}

