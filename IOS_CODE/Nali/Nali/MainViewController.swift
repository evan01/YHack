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
    var selectedNm = String()
    var selectedUserName = String()
    
    //Will switch the screen!!
    @IBAction func searchForFriend(_ sender: Any) {
        var compassView = self.storyboard?.instantiateViewController(withIdentifier: "COMPASS_SCREEN") as? CompassViewController
        compassView!.frndName = self.selectedNm
        compassView!.frndUserNm = self.selectedUserName
        self.present(compassView!, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //First thing is to get the users credentials from phone memory
        var usr = getCredentials()
        
        //Then start querying the back end
        let nc = NetworkClient()
        
        //Create a new user
        //nc.createUser(usr: usr)
        
        //Update our coordinates
        let p = getCurrentPosition()
        usr.pos = p
        nc.updatePosition(usr: usr)
        
    }
    
    func getCurrentPosition()->Position{
        var pos =  [37.3807498,-122.03050302]
        var CurrentPosition = Position()
        CurrentPosition.x = Float(pos[0])
        CurrentPosition.y = Float(pos[1])
        return CurrentPosition
    }
    
    func getCredentials()->User{
        //This function will get the mobile phones user credentials from memory
        var user = User()
        user.firstName = "Evan"
        user.lastName = "Knox"
        user.userName = "eknoxmobile"
        
        return user

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Implement the delegate protocol
    func updateSelectedLabel(selected : String, username : String){
        self.selectedNm = selected
        self.selectedUserName = username
        self.selectedName.text = self.selectedNm
    }
    
    //This class needs to care about messages from the friends list class
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? FriendsListController {
            dvc.delegate = self
        }
    }
    
}
