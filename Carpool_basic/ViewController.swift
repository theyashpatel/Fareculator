//
//  ViewController.swift
//  Carpool_basic
//
//  Created by Yash Patel on 26/08/16.
//  Copyright © 2016 Yash Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var noofpassengersegment: UISegmentedControl!
    
    //@IBOutlet weak var noofpassenger: UITextField!            // changes because of segmented control
    
    @IBOutlet weak var distancetravelled: UITextField!
    
    @IBOutlet weak var averageofcar: UITextField!
    
    @IBOutlet weak var fuelcost: UITextField!
    
    @IBOutlet weak var outputlabel: UILabel!
    
    @IBAction func dismiss(sender: AnyObject) {
        self.fuelcost.resignFirstResponder()
    }
    
    @IBAction func buttonpressed(sender: UIButton) {
        
        let noofpassenger :String? = String(noofpassengersegment.selectedSegmentIndex + 1)
        
        if noofpassenger! != "" && distancetravelled.text! != "" && averageofcar.text! != "" && fuelcost.text! != "" {
            
            if isdouble(Arrayofstrings: noofpassenger! , distancetravelled.text! , averageofcar.text! , fuelcost.text!){
                let costpertrip = calculatecost(Double(noofpassenger!)!, dist: Double(distancetravelled.text!)!, avg: Double(averageofcar.text!)!, fuel: Double(fuelcost.text!)!)
                outputlabel.text = "\(round(costpertrip*100)/100) ₹/person"
                }
            else {
//                noofpassenger = ""            // changes due to segmented control
                distancetravelled.text = ""
                averageofcar.text = ""
                fuelcost.text = ""
                self.outputlabel.text = "Enter Integer"
                delay(2.0){
                    self.outputlabel.text = "Developed by Yash"
                }

            }
        }
        else {
//            noofpassenger.text = ""           // changes due to segmented control
            distancetravelled.text = ""
            averageofcar.text = ""
            fuelcost.text = ""
            outputlabel.text = "Enter all fields"
            
            delay(2.0){
                self.outputlabel.text = "Developed by Yash"
            }
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}


func calculatecost(noofpassenger:Double , dist:Double , avg:Double , fuel:Double) -> Double {
    let cost = ((dist/avg)*fuel)/noofpassenger
    return cost
}

func delay(time:Double , closure : () -> () ) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

func isdouble(Arrayofstrings a:String ...) -> Bool {
    print (a)
    var isdub = true
    for i in a {
        
        let doubcheck:Double? = Double(i)
        if doubcheck == nil{
            isdub = false
        }
        
    }
    print (isdub)
    return isdub
}