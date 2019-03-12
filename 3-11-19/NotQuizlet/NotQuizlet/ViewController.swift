//
//  ViewController.swift
//  NotQuizlet
//
//  Created by student on 3/11/19.
//  Copyright © 2019 Cole Hemp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    
    var currentQuestionIndex: Int = 0
    
    let questions: [String] = [
    "What year is it?",
    "What color is a ripe tomato?",
    "What is a capital of Vermont?",
    "Who was the first US President?"
    ]
    
    let answers: [String] = [
    "2019",
    "Red",
    "Montpelier",
    "George Washington"
    ]
    
    @IBAction func questionButton(_ sender: UIButton) {
        //Test for Button Functionality
        //print("I clicked questionButton")
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count
        {
            currentQuestionIndex = 0
        }
        
        questionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
    }
    @IBAction func answerButton(_ sender: UIButton) {
        //Test for Button Functionality
        //print("I clicked answerButton")
        
        answerLabel.text = answers[currentQuestionIndex]
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        sliderLabel.text = String(Int(mySlider.value))
    }
    @IBAction func stepperAction(_ sender: UIStepper) {
        sliderLabel.text = "\(myStepper.value)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionLabel.text = questions[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

