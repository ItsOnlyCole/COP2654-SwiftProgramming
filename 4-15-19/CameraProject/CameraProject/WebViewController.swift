//
//  WebViewController.swift
//  CameraProject
//
//  Created by student on 4/15/19.
//  Copyright © 2019 ColeHemp. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var myWebsite: WKWebView!
    
    override func viewDidLoad() {
        let myURL = URL(string: "https://www.palmbeachstate.edu")
        let myRequest = URLRequest(url: myURL!)
        let testReauest = URLRequest(url: URL(string: "https://www.palmbeachstate.edu")!)
        myWebsite.load(myRequest)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
