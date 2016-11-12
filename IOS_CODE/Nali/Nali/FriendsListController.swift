//
//  FriendsListController.swift
//  Nali
//
//  Created by Evan Knox on 2016-11-12.
//  Copyright © 2016 parchican. All rights reserved.
//

import UIKit

protocol friendsTableDelegate{
    func updateSelectedLabel(selected:String)
}

class FriendsListController: UITableViewController {
    
    var friends = ["Evan","Donna","Jonathan","Alex","JD","Burri"]
    let cellIdentifier = "FRIEND_CELL"
    var model : Model? = nil
    var delegate : friendsTableDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black//Set background color to black

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //We want to use a custom cell, 
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FriendCellTableViewCell
        cell.fullName.text = friends[indexPath.row]

        return cell
    }
    
    //When the user selects the row, update the Main controllers label
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //Get the Main View Controller
        updateSelectedName(name: friends[indexPath.row])
    }
    
    //This function will take in a string and update the label in the parent VC that displays the selected table entries
    func updateSelectedName(name:String){
        print("Updating" + name)
        model?.selectedItem = name
        delegate?.updateSelectedLabel(selected: name)
    }
    

}
