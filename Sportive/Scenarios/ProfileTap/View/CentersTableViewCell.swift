//
//  CentersTableViewCell.swift
//  Sportive
//
//  Created by Ali Mohamed on 11/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class CentersTableViewCell: UITableViewCell {

    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var centerPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
