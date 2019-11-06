//
//  CommentTableViewCell.swift
//  Sportive
//
//  Created by Mustafa on 11/6/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos

class CommentTableViewCell: UITableViewCell {

  
    @IBOutlet weak var rateDegreeLbl: UILabel!
    
    @IBOutlet weak var rateStar: CosmosView!
    
    @IBOutlet weak var textViewComment: UITextView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
