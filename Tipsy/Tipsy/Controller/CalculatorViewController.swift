//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipBrain = TipBrain()
    
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        let buttonName = sender.currentTitle!
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if(buttonName == "0%"){
            zeroPctButton.isSelected = true
        }
        else if(buttonName == "10%"){
            tenPctButton.isSelected = true
        }
        else{
            twentyPctButton.isSelected = true
        }
        
        tipBrain.getTipAmount(buttonName: buttonName)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let userInput = Float(billTextField.text!) ?? 0.0
        tipBrain.calculateEachPersonAmount(userInput :userInput)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        let splitNumber = Int(sender.value)
        tipBrain.getSplitNumber(splitNumber: splitNumber)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "goToResult" {
         
        //inizialize the viewController that we want
        //segue.destination has a data type of UIViewController
        //So in order to narrow it down to say that the segue destination is accually a resultViewController we can you 'as'
         
        let destinationVC = segue.destination as! ResultViewController
            destinationVC.eachPersonAmount = tipBrain.returnEachPersonAmount()
            destinationVC.advice = tipBrain.returnAdvice()
//            destinationVC.textValue = "Split between \(splitNumber), with \(tipAmount) tip."
        }
    }
    
}

