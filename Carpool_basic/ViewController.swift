//
//  ViewController.swift
//  Carpool_basic
//
//  Created by Yash Patel on 26/08/16.
//  Copyright © 2016 Yash Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        animateView()
    }

    
    @IBOutlet weak var developerLogo: UIImageView!
    
    @IBOutlet weak var noofpassengersegment: UISegmentedControl!
    
    //@IBOutlet weak var noofpassenger: UITextField!
    
    @IBOutlet weak var distancetravelled: UITextField!
    
    @IBOutlet weak var averageofcar: UITextField!
    
    @IBOutlet weak var fuelcost: UITextField!
    
    @IBOutlet weak var outputlabel: UILabel!
    
    func animateView() {
        
        UIView.animate(withDuration: 5) {
            self.developerLogo.alpha = 1
        }
        
    }
    
    
    @IBAction func dismiss(_ sender: AnyObject) {
        self.fuelcost.resignFirstResponder()
    }
    
    @IBAction func buttonpressed(_ sender: UIButton) {
        
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
//                delay(2.0){
//                    self.outputlabel.text = "Developed by Yash"
//                }

            }
        }
        else {
//            noofpassenger.text = ""           // changes due to segmented control
            distancetravelled.text = ""
            averageofcar.text = ""
            fuelcost.text = ""
            outputlabel.text = "Enter all fields"
            
//            delay(2.0){
//                self.outputlabel.text = "Developed by Yash"
//            }
        }
        
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}


func calculatecost(_ noofpassenger:Double , dist:Double , avg:Double , fuel:Double) -> Double {
    let cost = ((dist/avg)*fuel)/noofpassenger
    return cost
}

func delay(_ time:Double , closure : @escaping () -> () ) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
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


