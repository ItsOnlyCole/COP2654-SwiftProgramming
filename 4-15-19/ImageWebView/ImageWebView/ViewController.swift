//
//  ViewController.swift
//  ImageWebView
//
//  Created by student on 4/15/19.
//  Copyright © 2019 ColeHemp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myImage.image = UIImage(named: "picture.jpg")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

