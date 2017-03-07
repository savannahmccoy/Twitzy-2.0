//
//  OtherProfileViewController.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/29/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit

class OtherProfileViewController: UIViewController {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    
    var tweet: Tweet?
    var user: User?
    //var tweetss: [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.user = tweet?.author
        let screenname = self.user?.screenname
        let username = self.user?.name
        let tweetcount = self.user?.tweetCount
        let followerscount = self.user?.followersCount
        let followingcount = self.user?.followingCount
        let tagline = self.user?.tagline as String!
        
        self.usernameLabel.text = username
        self.handleLabel.text = screenname
        self.tweetCountLabel.text = "\(tweetcount!)"
        self.followersCountLabel.text = "\(followerscount!)"
        self.followingCountLabel.text = "\(followingcount!)"
        self.backgroundImageView.setImageWithURL((NSURL(string: (self.user?.backgroundImageURL)!))!)
        self.profilePicImageView.setImageWithURL((NSURL(string: (self.user?.profilepic)!))!)
        self.taglineLabel.text = tagline
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
