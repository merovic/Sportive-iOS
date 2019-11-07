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

  
    @IBOutlet weak var rateView: UIView!{
        didSet{
            self.rateView.layer.cornerRadius = self.rateView.frame.height / 2
        }
    }
    @IBOutlet weak var rateDegreeLbl: UILabel!
    @IBOutlet weak var rateStar: CosmosView!
    @IBOutlet weak var textViewComment: UITextView!{
        didSet{
            self.textViewComment.layer.cornerRadius = 20    
        }
    }
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView! {
        didSet{
            ProfilePic.roundedPic(imageView: self.profileImage)
        }
    }
    
    override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
