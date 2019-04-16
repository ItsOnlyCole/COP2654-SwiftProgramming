//
//  ViewController.swift
//  WebKitViewExample
//
//  Created by student on 4/15/19.
//  Copyright © 2019 ColeHemp. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var myWebsite: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let myURL = URL(string: "http://michaelroedel.com")
        let myURL = URL(string: "https://www.palmbeachstate.edu")
        
        let myRequest = URLRequest(url: myURL!)
        
        myWebsite.load(myRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

