//
//  AddContactVC.swift
//  Nali
//
//  Created by Evan Knox on 2016-11-12.
//  Copyright © 2016 parchican. All rights reserved.
//

import UIKit

class AddContactVC: UIViewController {

    @IBOutlet weak var contactEntryBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactEntryBar.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func addNewContact(_ sender: Any) {
        let netInt = NetworkClient()
        
        //First get the contact entered
        let contact = contactEntryBar.text
        var contact_exists = netInt.contactExists(contact: contact!)
        print("trying to add contact:"+contact!)
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
        //Either way we want to go back to the main screen
        let mainMenu = self.storyboard?.instantiateViewController(withIdentifier: "MAIN_MENU")
        self.present(mainMenu!, animated: true, completion: nil)
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
//Need this to hide text bar when the user hits the enter key
extension AddContactVC: UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
