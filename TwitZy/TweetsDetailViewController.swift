//
//  TweetsDetailViewController.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/29/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit
import DateTools

class TweetsDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var detailTableView: UITableView!
    
    
    
    var tweetss: [Tweet] = []
    weak var delegate: TweetsDetailViewController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("passed1")
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.reloadData()
        
    }
   
    func tableView(detailTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("passed2")
        
        let cell = detailTableView.dequeueReusableCellWithIdentifier("DetailTableViewCell") as! DetailTableViewCell
        let row = indexPath.row
        let tweet = self.tweetss[row]
    
    
        print("passed3")
        let formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        formatter.timeStyle = .ShortStyle
        cell.detailTimeLabel.text = formatter.stringFromDate(tweet.timeStamp!)
        
        //cell.detailTimeLabel.text = String(tweet.timeStamp!)
        cell.usernameLabel.text = tweet.author?.name
        cell.tweetTextLabel.text = tweet.text
        cell.profilePicImageView.setImageWithURL((NSURL(string: tweet.author!.profilepic!))!)
        cell.handleLabel.text = tweet.author?.screenname
        cell.numberLikesLabel.text = "\(tweet.favoriteCount)"
        cell.numberRetweetsLabel.text = "\(tweet.retweetCount)"
    
        print("passed4")
        
        return cell
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


    
    
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    
    
 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    
    
    
    
    
    
    
    
    }
