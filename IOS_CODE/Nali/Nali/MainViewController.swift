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
    
    //Will switch the screen!!
    @IBAction func searchForFriend(_ sender: Any) {
        let compassView = self.storyboard?.instantiateViewController(withIdentifier: "COMPASS_SCREEN")
        
        self.present(compassView!, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let nc = NetworkClient()
//        nc.createUser()
        
        // Do any additional setup after loading the view.
        
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
    }
    
}
