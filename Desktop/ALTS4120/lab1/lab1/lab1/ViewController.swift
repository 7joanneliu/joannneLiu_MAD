//
//  ViewController.swift
//  lab1
//
//  Created by Joanne Liu on 9/12/18.
//  Copyright © 2018 Joanne Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func chooseState(_ sender: UIButton) {
        if sender.tag == 1 {
            radishImage.image=UIImage(named: "uncut")
        }
        else if sender.tag == 2 {
            radishImage.image=UIImage(named: "cut")
        }
    }
    @IBOutlet weak var radishImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

