//
//  ListTableViewCell.swift
//  manyLists pset05
//
//  Created by Maxim Stomphorst on 10/05/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var listCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
