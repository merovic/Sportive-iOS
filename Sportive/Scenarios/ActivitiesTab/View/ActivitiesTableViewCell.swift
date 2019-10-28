//
//  ActivitiesTableViewCell.swift
//  Sportive
//
//  Created by Ali Mohamed on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var rateButtonPressed: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
