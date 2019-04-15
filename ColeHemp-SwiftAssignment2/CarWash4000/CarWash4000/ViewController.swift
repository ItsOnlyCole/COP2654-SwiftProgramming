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
        updatePackageCostLabel(packageCostLabel)
        
    }
    
    
    func updatePackageCostLabel(_ packageCostLabel: UILabel)
    {
        packageCostLabel.text = "\(package.getName()):$\(package.getCost())"
    }
    func updateSoap(_ soapColorLabel: UILabel)
    {
        soapColorLabel.backgroundColor = package.getSoap()
    }

}

