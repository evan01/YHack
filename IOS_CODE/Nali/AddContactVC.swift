//
//  AddContactVC.swift
//  Nali
//
//  Created by Evan Knox on 2016-11-12.
//  Copyright © 2016 parchican. All rights reserved.
//

import UIKit

class AddContactVC: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func addNewContact(_ sender: Any) {
        let netInt = NetworkClient()
        
        //First get the contact entered
        let userName = userNameField.text
        
        let contact_exists = netInt.contactExists(contact: userName!)
        print("trying to add contact:"+userName!)
        if (contact_exists){
            //First check if contact exists on the database,
            //Yes, then add to contacts list
            
        }else{
            //No
            //Display an alert1
            let alert = UIAlertController(title: "Alert", message: "Error: Contact does not exis!t", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }

}

