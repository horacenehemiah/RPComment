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
    
    func getComments() {
        FIRDatabase.database().reference().observe(FIRDataEventType.value, with: {
            (snapshot) in
            
            self.rpComments = []
            
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshots {
                    if let commentDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let comment = RPComment(key: key, dictionary: commentDictionary)
                        self.rpComments.insert(comment, at: 0)
                        print("Comments: ", self.rpComments)
                    }
                }
            }
        })
    }

}
