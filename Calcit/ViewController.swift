//
//  ViewController.swift
//  Calcit
//
//  Created by Student on 2017-01-11.
//  Copyright © 2017 proapptive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var decimal: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    var isFirstDigit = true
    var operand1: Double = 0
    var history = [String]()
    var operation = "="
    
    var displayValue: Double {
        get {
            
            return NumberFormatter().number(from: displayLabel.text!)!.doubleValue
        }
        set {

            displayLabel.text = "\(newValue)"
            isFirstDigit = true
            operation = "="
            
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        displayLabel.text = isFirstDigit ? digit : displayLabel.text! + digit
        isFirstDigit = false
        if (digit == "."){
            self.decimal.isEnabled = false
        }
        
        
    }
    
    @IBAction func clearDisplay(sender: AnyObject) {
        displayValue = 0
        self.decimal.isEnabled = true
    }
    
    @IBAction func saveOperand(sender: UIButton) {
        operation = sender.currentTitle!
        operand1 = displayValue
        isFirstDigit = true
        self.decimal.isEnabled = true
    }
    
    
    @IBAction func negate(_ sender: UIButton) {
        displayValue = 0 - displayValue
    }
    
    @IBAction func perc(_ sender: UIButton) {
        displayValue /= 100
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        /*
        // To diplay History
        var value = String(operand1)+" "
        value += operation+" "
        value += String(displayValue)
        value += " = "
         */
        
        switch operation {
        case "/":
            
            if ((displayValue == 0) || (displayValue == 00))
            {
                displayLabel.text = "Not a number"
                isFirstDigit = true
                self.decimal.isEnabled = true
                
            }
            else
            {
                displayValue = operand1 / displayValue;self.decimal.isEnabled = true
            }
            
        case "*":displayValue *= operand1;self.decimal.isEnabled = true
        case "+":displayValue += operand1;self.decimal.isEnabled = true
        case "-":displayValue = operand1 - displayValue;self.decimal.isEnabled = true
        default:break
        }
        
       
       /*
        history += [value]
        print(history)*/
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

