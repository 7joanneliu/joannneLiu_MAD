//
//  ViewController.swift
//  midterm
//
//  Created by Joanne Liu on 10/18/18.
//  Copyright © 2018 Joanne Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var minuteInput: UITextField!
    @IBOutlet weak var weeklySwitch: UISwitch!
    @IBAction func weeklyUpdate(_ sender: UISwitch) {
        if weeklySwitch.isOn{
            weeklyCalc()
        }
        else{
            weeklyUncalc()
        }
    }
    @IBOutlet weak var calculateButton: UIButton!
    @IBAction func calcButton(_ sender: UIButton) {
        if Int(minuteInput.text!)! < 30{
            let alert = UIAlertController(title: "Not Enough Exercise", message:"You must exercise at least 30 minutes.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            minuteInput.text = "30"
        }
        else{
        runCalcs()
        swimCalcs()
        bikeCalcs()
        }
    }
    @IBOutlet weak var miles: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityControl: UISegmentedControl!
    @IBAction func activityChange(_ sender: UISegmentedControl) {
        if activityControl.selectedSegmentIndex == 0{
            activityImage.image = UIImage(named: "run")
            runCalcs()
        }
        
        else if activityControl.selectedSegmentIndex == 1{
            activityImage.image = UIImage(named: "swim")
            swimCalcs()
        }
        
        else if activityControl.selectedSegmentIndex == 2{
            activityImage.image = UIImage(named: "bike")
            bikeCalcs()
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true
    }
    
    func weeklyCalc(){
        var cals: Float
        cals = Float(calories.text!)!
        
        var mis: Float
        mis = Float(miles.text!)!
        let weeklyCals = cals * 7
        let weeklyMis = mis * 7
        let weeklyCalories = String(format:"%.2f", weeklyCals)
        calories.text = weeklyCalories
        let weeklyMiles = String(format:"%.2f", weeklyMis)
        miles.text = weeklyMiles
    }
    
    func weeklyUncalc(){
        var cals: Float
        cals = Float(calories.text!)!
        
        var mis: Float
        mis = Float(miles.text!)!
        let weeklyCals = cals / 7
        let weeklyMis = mis / 7
        let weeklyCalories = String(format:"%.2f", weeklyCals)
        calories.text = weeklyCalories
        let weeklyMiles = String(format:"%.2f", weeklyMis)
        miles.text = weeklyMiles
    }
    
    func runCalcs(){
        var mins: Float
        
        if minuteInput.text!.isEmpty{
            mins = 0.0
        }
        else{
            mins = Float(minuteInput.text!)!
        }

        let runMiles = mins/10
        let runCalories = mins * 10
        
        let milesCalc = String(format:"%.2f", runMiles)
        miles.text = milesCalc
        
        let caloriesCalc = String(format:"%.2f", runCalories)
        calories.text = caloriesCalc
    }//runEnd
    
    func swimCalcs(){
        var mins: Float
        
        if minuteInput.text!.isEmpty{
            mins = 0.0
        }
        else{
            mins = Float(minuteInput.text!)!
        }
        
        let swimMiles = mins/30
        let swimCalories = mins * 7
        
        let milesCalc = String(format:"%.2f", swimMiles)
        miles.text = milesCalc
        
        let caloriesCalc = String(format:"%.2f", swimCalories)
        calories.text = caloriesCalc
    }//swimEnd
    
    func bikeCalcs(){
        var mins: Float
        
        if minuteInput.text!.isEmpty{
            mins = 0.0
        }
        else{
            mins = Float(minuteInput.text!)!
        }
        
        let bikeMiles = mins / 4
        let bikeCalories = mins * 8.5
        
        let milesCalc = String(format:"%.2f", bikeMiles)
        miles.text = milesCalc
        
        let caloriesCalc = String(format:"%.2f", bikeCalories)
        calories.text = caloriesCalc
    }//bikeEnd
    

//    func textFieldDidEndEditing(_ textField: UITextField) {
//        runCalcs()
//        swimCalcs()
//        bikeCalcs()
//    }

    
    override func viewDidLoad() {
        minuteInput.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

