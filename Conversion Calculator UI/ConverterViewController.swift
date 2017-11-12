//
//  ConverterViewController.swift
//  Conversion Calculator UI
//
//  Created by YUZHOU on 11/6/17.
//  Copyright © 2017 YUZHOU. All rights reserved.
//
import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var BlueDisplay: UITextField!
    @IBOutlet weak var BlueInput: UITextField!
    
    
    @IBOutlet weak var WhiteDisplay: UITextField!
    
    @IBOutlet weak var WhiteInput: UITextField!
    
    var numbers: String = ""
    var choice: Int = 1
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        WhiteDisplay.textAlignment = .right
        BlueDisplay.textAlignment = .right
        
        numbers = numbers + String(sender.tag-1)
        WhiteDisplay.text = numbers
        print(numbers)
        
        
        switch choice {
        case 1:
            self.BlueDisplay.text = self.fToC(numbers)
        case 2:
            self.BlueDisplay.text = self.cToF(numbers)
        case 3:
            self.BlueDisplay.text = self.kTom(numbers)
        case 4:
            self.BlueDisplay.text = self.mTok(numbers)
        default:
            self.BlueDisplay.text = "default"
        }
        
    }
    
    var checkif = 0
    @IBAction func dot(_ sender: UIButton) {
        if (checkif == 0){
            numbers = numbers + "."
            WhiteDisplay.text=numbers
            
            checkif=1
        }
    }
    
    @IBAction func convert(_ sender: AnyObject) {
        let alert = UIAlertController(title: "choose a converter",message:nil,preferredStyle:UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title:"fahrenheit to celcius",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.WhiteInput.text = "°F"
            self.BlueInput.text = "°C"
            self.choice = 1
            self.WhiteDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.BlueDisplay.text = self.fToC(self.numbers)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title:"celcius to fahrenheit",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.WhiteInput.text = "°C"
            self.BlueInput.text = "°F"
            self.choice = 2
            self.WhiteDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.BlueDisplay.text = self.cToF(self.numbers)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title:"miles to kilometers",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.WhiteInput.text = "mi"
            self.BlueInput.text = "km"
            self.choice = 3
            self.WhiteDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.BlueDisplay.text = self.mTok(self.numbers)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title:"kilometers to miles",style:UIAlertActionStyle.default,handler:{ (alertAction) -> Void in
            self.WhiteInput.text = "km"
            self.BlueInput.text = "mi"
            self.choice = 4
            self.WhiteDisplay.text = self.numbers
            if (self.numbers != "")
            {
                self.BlueDisplay.text = self.kTom(self.numbers)
            }
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func fToC(_ ferenheight: String) -> String {
        
        let new: Double = Double(ferenheight)!
        
        let total = (new - 32) * (5/9)
        
        return String(format: "%.2f", total )
        
    }
    
    func cToF(_ celcius: String) -> String {
        
        let new: Double = Double(celcius)!
        
        let total = new * (9/5) + 32
        
        return String(format: "%.2f", total )
        
    }
    
    func kTom(_ kilometers: String) -> String {
        
        let new: Double = Double(kilometers)!
        let multiplier: Double = 0.62
        
        let total = new * multiplier
        
        return String(total)
        
    }
    
    func mTok(_ miles: String) -> String {
        
        let new: Double = Double(miles)!
        let multiplier: Double = 1.61
        
        let total = new * multiplier
        
        return String(total)
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        if (sender.tag == 11)
        {
            BlueDisplay.text = nil
            WhiteDisplay.text = nil
            numbers=""
            checkif=0
        }
    }
    
    @IBAction func posOrNeg(_ sender: UIButton) {
        
        var lessZ : Double
        
        
        
        if (numbers == "")
        {
            return
        }
        if (numbers == ".")
        {
            return
        }
        if let test = Double(numbers),
            (test < 0)
        {
            lessZ = abs(test)
            numbers = String(lessZ)
            checkif=1
            
        }
        else {
            numbers = "-" + numbers
        }
        
        WhiteDisplay.text = numbers
        switch choice {
        case 1:
            self.BlueDisplay.text = self.fToC(numbers)
        case 2:
            self.BlueDisplay.text = self.cToF(numbers)
        case 3:
            self.BlueDisplay.text = self.kTom(numbers)
        case 4:
            self.BlueDisplay.text = self.mTok(numbers)
        default:
            self.BlueDisplay.text = "default"
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BlueInput.text="°C"
        self.WhiteInput.text="°F"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
