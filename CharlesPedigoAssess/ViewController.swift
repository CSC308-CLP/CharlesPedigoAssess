//
//  ViewController.swift
//  CharlesPedigoAssess
//
//  Created by Pedigo, Charles L. on 4/21/26.
//

import UIKit

class ViewController: UIViewController {

    //BMI Calculator Elements
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var bmiHeightTextField: UITextField!
    @IBOutlet weak var bmiWeightTextField: UITextField!
    @IBOutlet weak var bmiResultLabel: UILabel!
    
    @IBAction func computeBMIButton(_ sender: UIButton) {
        //Calculate BMI
        let height = Double(bmiHeightTextField.text ?? "0") ?? 0
        let weight = Double(bmiWeightTextField.text ?? "0") ?? 0
        let bmi = weight / (height * height * 0.0001)
        var bmiType: String = ""
        //Determine weight class
        if bmi < 18.5 {
            bmiResultLabel.backgroundColor = .systemBlue
            bmiType = "Underweight"
        }else if bmi < 24.9 {
            bmiResultLabel.backgroundColor = .systemGreen
            bmiType = "Normal"
        }else if bmi < 29.9 {
            bmiResultLabel.backgroundColor = .systemYellow
            bmiType = "Overweight"
        }else {
            bmiResultLabel.backgroundColor = .systemRed
            bmiType = "Obese"
        }
        //Display result
        let bmiResult = String(format: "%.2f", bmi)
        bmiResultLabel.text = "BMI: "+bmiResult+", Result: "+bmiType
    }
    
    @IBAction func bmiLabelSwitch(_ sender: Any) {
        //Swaps between hiding and showing result label
        if bmiResultLabel.isHidden {
            bmiResultLabel.isHidden = false
        }else{
            bmiResultLabel.isHidden = true
        }
    }
    
    @IBAction func genderSegmentChange(_ sender: Any) {
        //Changes background color to represent gender
        if genderSegmentControl.selectedSegmentIndex == 0 {
            view.backgroundColor = .systemOrange
        }else{
            view.backgroundColor = .systemRed
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

