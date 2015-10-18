//
//  ViewController.swift
//  FB-Parse Login
//
//  Created by Melissa Zellhuber on 10/17/15.
//  Copyright © 2015 mzellhuber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let permissions = ["public_profile"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func login(sender: AnyObject) {
        
        PFFacebookUtils.logInWithPermissions(self.permissions,
            block: {
                (user: PFUser?, error: NSError?) -> Void in
                if let user = user {
                    if user.isNew {
                        print("User signed up and logged in through Facebook!")
                    } else {
                        print("User logged in through Facebook!")
                    }
                    
                    let alertController = UIAlertController(title: "Success", message: "User logged in", preferredStyle: .Alert)
                    
                    let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
                        //print(action)
                    }
                    alertController.addAction(okAction)
                    
                    self.presentViewController(alertController, animated: true) {
                        //after login actions
                    }
                } else {
                    print("Uh oh. The user cancelled the Facebook login.")
                    print(error)
                }
        })
    }
    
    
}

