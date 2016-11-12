//
//  FriendCellTableViewCell.swift
//  Nali
//
//  Created by Evan Knox on 2016-11-12.
//  Copyright © 2016 parchican. All rights reserved.
//

import UIKit

class FriendCellTableViewCell: UITableViewCell {

    @IBOutlet weak var fullName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
