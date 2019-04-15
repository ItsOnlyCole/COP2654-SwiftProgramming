//
//  ViewController.swift
//  CarWash4000
//
//  Created by student on 3/25/19.
//  Copyright © 2019 ColeHemp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var customer = Customer()
    var package = Package()
    var remainingWax: Int = 10
    var numOfCarsWashed: Int = 0
    
    @IBOutlet weak var numOfCarsWashedLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var packageCostLabel: UILabel!
    @IBOutlet weak var packageSelectionSlider: UISlider!
    @IBOutlet weak var soapColorLabel: UILabel!
    @IBOutlet weak var coatsOfWaxLabel: UILabel!
    @IBOutlet weak var numCoatsOfWaxLabel: UILabel!
    @IBOutlet weak var vehicleTypeLabel: UILabel!
    @IBOutlet weak var specialtyCarSurchargeLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var activationSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Sets up the wash.
        resetWash()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getNameChange(_ sender: UITextField)
    {
        customer.setName(name: nameTextField.text!)
    }
    
    
    @IBAction func finalizeNameChange(_ sender: UITextField)
    {
        welcomeLabel.text = "Welcome \(customer.getName())!"
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
    
    //Update Functions
    func updateNumOfCarsWashed(_ numOfCarsWashedLabel: UILabel)
    {
        numOfCarsWashed = numOfCarsWashed + 1
        numOfCarsWashedLabel.text = "\(numOfCarsWashed)"
    }
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
        if(package.getCoatsOfWax() > remainingWax)
        {
            let alert = UIAlertController(title: "Out of Wax!", message: "Sorry for the inconvience.\nWe usually have \(package.getCoatsOfWax()) coats of wax for this package, but we're out of wax. As compensation, you'll recieve a discount on your package price.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
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
        //Resets Customer Name
        customer.setName(name: "")
        nameTextField.text = ""
        nameTextField.placeholder = "Name"
        welcomeLabel.text = "Welcome!"
        
        //Resets Package info
        packageSelectionSlider.value = 0.0
        package.setPackage(packageNumber: 0)
        customer.setPackage(package: package.getName())
        updatePackageCostLabel(packageCostLabel)
        updateSoap(soapColorLabel)
        updateCoatsOfWax(numCoatsOfWaxLabel, coatsOfWaxLabel)
        
        //Resets Vehicle Info
        customer.setCarType(carType: "")
        vehicleTypeLabel.text = "Vehicle type"
        vehicleTypeLabel.isHidden=true
        package.setSpecialtyCarSurcharge(specialtyCarSurcharge: false, specialtyCarSurchargePrice: 0.00)
        specialtyCarSurchargeLabel.isHidden = true
        
        //Updates Price
        updatePrice()
    }
    @IBAction func activateWash(_ sender: UISwitch)
    {
        //Checks if everything is filled out.
        if (customer.getName() != "" && customer.getPackage() != "" && customer.getCarType() != "")
        {
            //Add Alert
            let alert = UIAlertController(title: "Wash Completed", message: "Your car has been washed.\nHave a good day!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            sleep(2)
            self.present(alert, animated: true)
            resetWash()
            updateNumOfCarsWashed(numOfCarsWashedLabel)
            activationSwitch.isOn = false
        }
        else if (customer.getName() == "")
        {
            let alert = UIAlertController(title: "Invalid Name!", message: "Please input a name.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            activationSwitch.isOn = false
        }
        else if (customer.getCarType() == "")
        {
            let alert = UIAlertController(title: "Invalid Car!", message: "Please select the type of car you drive.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            activationSwitch.isOn = false
        }
        else if (customer.getPackage() == "")
        {
            let alert = UIAlertController(title: "Invalid Package!", message: "Please select the type of car wash package you want.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            activationSwitch.isOn = false
        }
        else
        {
            let alert = UIAlertController(title: "Error!", message: "An unknown error has occured.\nPlease try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            resetWash()
            activationSwitch.isOn = false
        }

    }
    
    
    
    
    
    

}

