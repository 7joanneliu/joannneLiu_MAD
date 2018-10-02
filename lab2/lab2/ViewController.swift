//
//  ViewController.swift
//  lab2
//
//  Created by Joanne Liu on 9/19/18.
//  Copyright © 2018 Joanne Liu. All rights reserved.
//
//Requirements:
// segment control: image(top) + text shadow(top) + capitalization(top)
// switch: text(middle) + image(bottom)
// slider: text(top)
// change image: done
// change text in label: done
// change size of text in label: done
// change capitalization of text in label: done
// changecolor of text in label: done(changed text shadow color instead)

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var timeImage: UIImageView!
    @IBOutlet weak var fixImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fixLabel: UILabel!
    
    //segment control
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBAction func changeImg(_ sender: Any) {
        if imageControl.selectedSegmentIndex == 0 {
            timeImage.image = UIImage(named:"sun")
            titleLabel.text = titleLabel.text?.lowercased()
            titleLabel.shadowColor = UIColor.yellow
        }
        else if imageControl.selectedSegmentIndex == 1 {
            timeImage.image = UIImage(named: "moon")
            titleLabel.text = titleLabel.text?.uppercased()
            titleLabel.shadowColor = UIColor.blue
        }
    }//sgmnt end
    
    //switch
    @IBOutlet weak var fixSwitch: UISwitch!
    @IBAction func updateFix(_ sender: UISwitch) {
        if fixSwitch.isOn {
            fixImage.image = UIImage(named: "nap")
            fixLabel.text="i s  a  n a p"
        }
        else {
            fixImage.image = UIImage(named: "coffee")
            fixLabel.text="i s  c o f f e e"
        }
    }//switch end
    
    //slider
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize = sender.value
        let fontSizeCGFloat=CGFloat(fontSize)
            titleLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

