//
//  Operations.swift
//  RPComment
//
//  Created by Nehemiah Horace on 4/5/17.
//  Copyright © 2017 Nehemiah Horace. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Operations: NSObject {
    
    var rpComments = [RPComment]()
    
    func storeComment(_ commentTextView: UITextView) {
        let commentID = FIRDatabase.database().reference().child(NSUUID().uuidString)
        let commentMessage = commentTextView.text
        FIRDatabase.database().reference().child(commentID.key).setValue([
            "comment":commentMessage
        ])
    }

}
