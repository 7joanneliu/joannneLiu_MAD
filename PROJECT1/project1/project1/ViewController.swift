//
//  ViewController.swift
//  project1
//
//  Created by Joanne Liu on 10/14/18.
//  Copyright © 2018 Joanne Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBAction func infoButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Calculate the Price for One", message:"Input the total cost and number of items in a package to find the cheapest option.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    //Item One
    @IBOutlet weak var costOne: UITextField!
    @IBOutlet weak var amountOne: UITextField!
    @IBOutlet weak var perOne: UILabel!
    @IBOutlet weak var iconOne: UIImageView!
    //Item Two
    @IBOutlet weak var costTwo: UITextField!
    @IBOutlet weak var amountTwo: UITextField!
    @IBOutlet weak var perTwo: UILabel!
    @IBOutlet weak var iconTwo: UIImageView!
    //Item Three
    @IBOutlet weak var costThree: UITextField!
    @IBOutlet weak var amountThree: UITextField!
    @IBOutlet weak var perThree: UILabel!
    @IBOutlet weak var iconThree: UIImageView!
    //Item Four
    @IBOutlet weak var costFour: UITextField!
    @IBOutlet weak var amountFour: UITextField!
    @IBOutlet weak var perFour: UILabel!
    @IBOutlet weak var iconFour: UIImageView!
    
    //done button tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //tap out of text field reference from https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //functions for calculations
    var quotientArray=[0.0,0.0,0.0,0.0]
//    var quotientArray=[Float]()
    //var quotientArraySorted=quotientArray.sort()
    
    func quotient(cost:Float, amount:Float) -> Float{
        return cost/amount;
    }
    
    func itemOne(){
        var costEntry:Float
        var amountEntry:Float
        
        if costOne.text!.isEmpty{
            costEntry=0.0
        }
        else{
            costEntry=Float(costOne.text!)!
        }
        if amountOne.text!.isEmpty{
            amountEntry=1
        }
        else{
            amountEntry=Float(amountOne.text!)!
        }
        let itemOneQuotient = quotient(cost:costEntry,amount:amountEntry)
        quotientArray[0]=Double(itemOneQuotient)
//        quotientArray.append(itemOneQuotient)
        let itemOneQuotientCalc = String(format:"%.2f", itemOneQuotient)
        perOne.text = itemOneQuotientCalc
    }//item one
    
    func itemTwo(){
        var costEntry:Float
        var amountEntry:Float
        
        if costTwo.text!.isEmpty{
            costEntry=0.0
        }
        else{
            costEntry=Float(costTwo.text!)!
        }
        if amountTwo.text!.isEmpty{
            amountEntry=1
        }
        else{
            amountEntry=Float(amountTwo.text!)!
        }
        let itemTwoQuotient = quotient(cost:costEntry,amount:amountEntry)
        quotientArray[1]=Double(itemTwoQuotient)
//        quotientArray.append(itemTwoQuotient)
        let itemTwoQuotientCalc = String(format:"%.2f", itemTwoQuotient)
        perTwo.text = itemTwoQuotientCalc
    }//item two
    
    func itemThree(){
        var costEntry:Float
        var amountEntry:Float
        
        if costThree.text!.isEmpty{
            costEntry=0.0
        }
        else{
            costEntry=Float(costThree.text!)!
        }
        if amountThree.text!.isEmpty{
            amountEntry=1
        }
        else{
            amountEntry=Float(amountThree.text!)!
        }
        let itemThreeQuotient = quotient(cost:costEntry,amount:amountEntry)
        quotientArray[2]=Double(itemThreeQuotient)
//        quotientArray.append(itemThreeQuotient)
        let itemThreeQuotientCalc = String(format:"%.2f", itemThreeQuotient)
        perThree.text = itemThreeQuotientCalc
    }//item three
    
    func itemFour(){
        var costEntry:Float
        var amountEntry:Float
        
        if costFour.text!.isEmpty{
            costEntry=0.0
        }
        else{
            costEntry=Float(costFour.text!)!
        }
        if amountFour.text!.isEmpty{
            amountEntry=1
        }
        else{
            amountEntry=Float(amountFour.text!)!
        }
        let itemFourQuotient = quotient(cost:costEntry,amount:amountEntry)
        quotientArray[3]=Double(itemFourQuotient)
//        quotientArray.append(itemFourQuotient)
        let itemFourQuotientCalc = String(format:"%.2f", itemFourQuotient)
        perFour.text = itemFourQuotientCalc
    }//item four
    
    func sort(){
        var quotientArrayNew = quotientArray
        quotientArrayNew.sort(){ $0 > $1}
        let firstMax=quotientArrayNew[0]
        let secondMax=quotientArrayNew[1]
        let thirdMax=quotientArrayNew[2]
        let fourthMax=quotientArrayNew[3]
        
//        for (index, value) in quotientArray.enumerated(){
//            if firstMax ==
//        }
        
        

        //icon one
        switch quotientArray[0] {
        case firstMax:
            if firstMax==0.0{
                iconOne.image=UIImage(named: "grey")
            }
            else{
            iconOne.image=UIImage(named: "red")
            }
        case secondMax:
            if secondMax==0.0{
                iconOne.image=UIImage(named: "grey")
            }
            else{
            iconOne.image=UIImage(named: "orange")
            }
        case thirdMax:
            if thirdMax==0.0{
                iconOne.image=UIImage(named: "grey")
            }
            else{
            iconOne.image=UIImage(named: "yellow")
            }
        case fourthMax:
            if fourthMax==0.0{
                iconOne.image=UIImage(named: "grey")
            }
            else{
            iconOne.image=UIImage(named: "green")
            }

        default:
            iconOne.image=UIImage(named: "grey")
        }

        //icon 2
        switch quotientArray[1] {
        case firstMax:
            if firstMax==0.0{
                iconTwo.image=UIImage(named: "grey")
            }
            else{
            iconTwo.image=UIImage(named: "red")
            }
        case secondMax:
            if secondMax==0.0{
                iconTwo.image=UIImage(named: "grey")
            }
            else{
            iconTwo.image=UIImage(named: "orange")
            }
        case thirdMax:
            if thirdMax==0.0{
                iconTwo.image=UIImage(named: "grey")
            }
            else{
            iconTwo.image=UIImage(named: "yellow")
            }
        case fourthMax:
            if fourthMax==0.0{
                iconTwo.image=UIImage(named: "grey")
            }
            else{
            iconTwo.image=UIImage(named: "green")
            }
        default:
            iconTwo.image=UIImage(named: "grey")
        }

        //icon 3
        switch quotientArray[2] {
        case firstMax:
            if firstMax==0.0{
                iconThree.image=UIImage(named: "grey")
            }
            else{
            iconThree.image=UIImage(named: "red")
            }
        case secondMax:
            if secondMax==0.0{
                iconThree.image=UIImage(named: "grey")
            }
            else{
            iconThree.image=UIImage(named: "orange")
            }
        case thirdMax:
            if thirdMax==0.0{
                iconThree.image=UIImage(named: "grey")
            }
            else{
            iconThree.image=UIImage(named: "yellow")
            }
        case fourthMax:
            if fourthMax==0.0{
                iconThree.image=UIImage(named: "grey")
            }
            else{
            iconThree.image=UIImage(named: "green")
            }
        default:
            iconThree.image=UIImage(named: "grey")
        }

        //icon 4
        switch quotientArray[3] {
        case firstMax:
            if firstMax==0.0{
                iconFour.image=UIImage(named: "grey")
            }
            else{
            iconFour.image=UIImage(named: "red")
            }
        case secondMax:
            if secondMax==0.0{
                iconFour.image=UIImage(named: "grey")
            }
            else{
            iconFour.image=UIImage(named: "orange")
            }
        case thirdMax:
            if thirdMax==0.0{
                iconFour.image=UIImage(named: "grey")
            }
            else{
            iconFour.image=UIImage(named: "yellow")
            }
        case fourthMax:
            if fourthMax==0.0{
                iconFour.image=UIImage(named: "grey")
            }
            else{
            iconFour.image=UIImage(named: "green")
            }
        default:
            iconFour.image=UIImage(named: "grey")
        }
    }
    
    //update labels
    func textFieldDidEndEditing(_ textField: UITextField) {
        itemOne()
        itemTwo()
        itemThree()
        itemFour()
        sort()
    }
    
    override func viewDidLoad() {
        //Assign controller as delegate for each text field so it will tell it's delegate when done key tapped
        costOne.delegate=self
        amountOne.delegate=self
        costTwo.delegate=self
        amountTwo.delegate=self
        costThree.delegate=self
        amountThree.delegate=self
        costFour.delegate=self
        amountFour.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

