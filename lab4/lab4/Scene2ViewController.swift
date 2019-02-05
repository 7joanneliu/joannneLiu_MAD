//
//  Scene2ViewController.swift
//  lab4
//
//  Created by Joanne Liu on 10/11/18.
//  Copyright © 2018 Joanne Liu. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userNeed: UITextField!
    @IBOutlet weak var userHave: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneIngredients"{
            let scene1ViewController = segue.destination as! ViewController
            //check to see that text was entered in the textfields
            if userHave.text!.isEmpty == false{
                scene1ViewController.user.haveIng=userHave.text
            }
            if userNeed.text!.isEmpty == false{
            scene1ViewController.user.needIng=userNeed.text
            }
        }
    }
    
    override func viewDidLoad() {
        userHave.delegate=self
        userNeed.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) ->Bool{
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
