//
//  GameTableViewCell.swift
//  Sportive
//
//  Created by Mustafa on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    
    //MARK - IBOutlet

    @IBOutlet weak var gameNameLbl: UILabel!
    @IBOutlet weak var trainerLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
