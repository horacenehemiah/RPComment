//
//  ViewController.swift
//  RPComment
//
//  Created by Nehemiah Horace on 4/5/17.
//  Copyright © 2017 Nehemiah Horace. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextView: UITextView!
    
    let operations = Operations()
    var rpComments = [RPComment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getComments()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rpComments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! TableViewCell
        let comment = rpComments[indexPath.row]
        
        cell.configureCell(comment)
        return cell
    }

    @IBAction func comment(_ sender: Any) {
        operations.storeComment(commentTextView)
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
            self.tableView.reloadData()
        })
    }

}

