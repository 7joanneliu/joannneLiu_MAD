//
//  ViewController.swift
//  lab4
//
//  Created by Joanne Liu on 10/11/18.
//  Copyright © 2018 Joanne Liu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var needLabel: UILabel!
    @IBOutlet weak var haveLabel: UILabel!
    
    let filename = "ingredients.plist"
    
    var user=Ingredients()
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        haveLabel.text=user.haveIng
        needLabel.text=user.needIng
    }
    
    func dataFileURL(_ filename:String) -> URL? {
        //returns an array of URLs for the document directory in the user's home directory
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        var url : URL?
        //append the file name to the first item in the array which is the document directory
        url = urls.first?.appendingPathComponent(filename)
        //return the URL of the data file or nil if it does not exist
        return url
    }

    override func viewDidLoad() {
        let fileURL = dataFileURL(filename)
        //if data file exists use
        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
            let url = fileURL!
            do{
                //creates a dt buffer w/ contents of plist
                let data = try Data(contentsOf: url)
                //create instance of PropertyListDecoder
                let decoder = PropertyListDecoder()
                //decode data using structure of Ingredients
                user=try decoder.decode(Ingredients.self, from:data)
                //assing data to textfields
                haveLabel.text=user.haveIng
                needLabel.text=user.needIng
            }
            catch{
                print("no file")
            }
        }
        else{
            print("file does not exist")
        }
        
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(_:)), name: Notification.Name.UIApplicationWillResignActive, object: app)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    @objc func applicationWillResignActive(_ notification: Notification){
        //url of data file
        let fileURL = dataFileURL(filename)
        //create an instance of PropertyListEncoder
        let encoder = PropertyListEncoder()
        //set format type to xml
        encoder.outputFormat = .xml
        do {
            //encode the data using the structure of the Favorite class
            let plistData = try encoder.encode(user)
            //write encoded data to the file
            try plistData.write(to: fileURL!)
        } catch {
            print("write error")
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

