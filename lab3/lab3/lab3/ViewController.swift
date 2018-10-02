//
//  ViewController.swift
//  lab3
//
//  Created by Joanne Liu on 10/2/18.
//  Copyright © 2018 Joanne Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBAction func definitionButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "BMR", message:"Basel Metabolic Rate. How much energy your body uses at rest.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //men BMR
    @IBOutlet weak var ageM: UITextField!
    @IBOutlet weak var heightM: UITextField!
    @IBOutlet weak var weightM: UITextField!
    @IBOutlet weak var rateM: UILabel!
    
    //women BMR
    @IBOutlet weak var ageW: UITextField!
    @IBOutlet weak var heightW: UITextField!
    @IBOutlet weak var weightW: UITextField!
    @IBOutlet weak var rateW: UILabel!
    
    func popUp (_sender:UIButton){
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true
    }
   
    //reference from https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //BMR Women Calcs
    func bmrW(){

        var wAge = Float(ageW.text!)
        var wHeight = Float(heightW.text!)
        var wWeight = Float(weightW.text!)
        
        if ageW.text!.isEmpty {
            wAge = 0.0
        }
        else{
            wAge = Float(ageW.text!)!
        }
        if weightW.text!.isEmpty {
            wWeight = 0.0
        } else {
            wWeight = Float(weightW.text!)!
        }
        
        if heightW.text!.isEmpty {
            wHeight = 0.0
        }
        else{
            wHeight = Float(heightW.text!)!
            }
            
            
        let weightCalc = 4.35 * wWeight!
        let heightCalc = 4.7 * wHeight!
        let ageCalc = 4.7 * wAge!
        let adding = 655 + weightCalc + heightCalc
        let wBMR = adding - ageCalc
        let wBMRcalc = String(format:"%.2f", wBMR)
        rateW.text = wBMRcalc
    }
    
    
    //men BMR Calcs
    func bmrM(){
        var mAge = Float(ageM.text!)
        var mHeight = Float(heightM.text!)
        var mWeight = Float(weightM.text!)
        
        if ageM.text!.isEmpty {
            mAge = 0.0
        }
        else{
            mAge = Float(ageM.text!)!
        }
        if weightM.text!.isEmpty { mWeight = 0.0
        } else {
            mWeight = Float(weightM.text!)!
        }
        if heightM.text!.isEmpty {
            mHeight = 0.0
        }
        else{
            mHeight = Float(heightM.text!)!
        }
        
        
        let weightCalcm = 6.23 * mWeight!
        let heightCalcm = 12.7 * mHeight!
        let ageCalcm = 6.8 * mAge!
        let addingm = 66 + weightCalcm + heightCalcm
        let mBMR = addingm - ageCalcm
        let mBMRcalc = String(format:"%.2f", mBMR)
        rateM.text = mBMRcalc
    }
    
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bmrW()
        bmrM()
    }


    
    override func viewDidLoad() {
        ageW.delegate=self
        heightW.delegate=self
        weightW.delegate=self
        ageM.delegate=self
        heightM.delegate=self
        ageM.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

