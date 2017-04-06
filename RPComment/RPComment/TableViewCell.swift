//
//  TableViewCell.swift
//  RPComment
//
//  Created by Nehemiah Horace on 4/5/17.
//  Copyright © 2017 Nehemiah Horace. All rights reserved.
//

import UIKit
import Firebase

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentLabel: UILabel!
    var rpComment: RPComment!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ comment: RPComment) {
        rpComment = comment
        commentLabel.text = rpComment.commentMessage
    }

}
