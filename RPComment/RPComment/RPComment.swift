//
//  RPComment.swift
//  RPComment
//
//  Created by Nehemiah Horace on 4/5/17.
//  Copyright © 2017 Nehemiah Horace. All rights reserved.
//

import Foundation

struct RPComment {
    fileprivate var _commentKey: String!
    fileprivate var _commentMessage: String!
    
    var commentKey: String {
        return _commentKey
    }
    
    var commentMessage: String {
        return _commentMessage
    }
    
    // Initialize the new Post
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._commentKey = key
        
        // Within the Post, or Key, the following properties are children
        
        if let comment = dictionary["comment"] as? String {
            self._commentMessage = comment
        }
    }
}
