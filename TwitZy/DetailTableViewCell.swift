//
//  DetailTableViewCell.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/30/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

   
    @IBOutlet weak var detailTimeLabel: UILabel!
    @IBOutlet weak var retweetedByLabel: UILabel!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var numberLikesLabel: UILabel!
    @IBOutlet weak var numberRetweetsLabel: UILabel!
    
    
    
    var tweet: [Tweet] = [] {
        didSet {
          /*  nameLabel.text = tweet.user?.name
            nameLabel.sizeToFit()
            if let screenName = tweet.user?.screenName {
                screenNameLabel.text = "@\(screenName)"
            }
            tweetTextLabel.text = tweet.text
            if let profileImageURL = tweet.user?.profileImageURL {
                profileImageView.setImageWithURL(NSURL(string: profileImageURL)!)
            }
            createdAtLabel.text = tweet.createdAtStringMedium*/
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
