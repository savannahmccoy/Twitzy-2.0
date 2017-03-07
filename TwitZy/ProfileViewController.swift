//
//  ProfileViewController.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/29/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit
import AFNetworking

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetsCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let followingCount = User.currentUser?.followingCount
        let followersCount = User.currentUser?.followersCount
        let tweetCount = User.currentUser?.tweetCount
        
        self.usernameLabel.text = User.currentUser?.name
        self.handleLabel.text = User.currentUser?.screenname
        self.profilePicImageView.setImageWithURL((NSURL(string: (User.currentUser?.profilepic)!))!)
        self.headerImageView.setImageWithURL((NSURL(string: (User.currentUser?.backgroundImageURL)!))!)
        self.followersCountLabel.text = String(followersCount!)
        self.followingCountLabel.text = "\(followingCount!)"
        self.taglineLabel.text = User.currentUser?.tagline! as String!
        self.tweetsCountLabel.text = "\(tweetCount!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

    @IBAction func LogOutAction(sender: UIButton) {
    
        TwitterClient.sharedInstance.logout()
    
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
