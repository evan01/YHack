//
//  MainViewController.swift
//  Nali
//
//  Created by Evan Knox on 2016-11-11.
//  Copyright © 2016 parchican. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, friendsTableDelegate{
    
    @IBOutlet weak var selectedName: UILabel!
    var friends = ["Evan","Donna","Jonathan","Alex","JD","Burri"]
    var flc = FriendsListController()
    
    //Will switch the screen!!
    @IBAction func searchForFriend(_ sender: Any) {
        let compassView = self.storyboard?.instantiateViewController(withIdentifier: "COMPASS_SCREEN")
        
        self.present(compassView!, animated: true, completion: nil)
    }
    
    @IBAction func addNewFriend(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Name",
                                      message: "Add a new name",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields!.first
                                        self.names.append(textField!.text!)
                                        self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextField {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                              animated: true,
                              completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Implement the delegate protocol
    func updateSelectedLabel(selected : String){
        self.selectedName.text = selected
    }
    
    //This class needs to care about messages from the friends list class
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? FriendsListController {
            dvc.delegate = self
        }
        
        if (segue.identifier == "myEmbeddedSegue") {
            let childViewController = segue.destination as! FriendsListController
            childViewController.friends = friends
            self.flc = childViewController
        }
    }
    
}
