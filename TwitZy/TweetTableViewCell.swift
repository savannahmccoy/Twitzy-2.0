//
//  TweetTableViewCell.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/29/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit

/*protocol TweetCellDelegate: class {
    func didReplyToTweet(tweet: Tweet)
}*/

class TweetTableViewCell: UITableViewCell, UITableViewDelegate {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    //var delegate: TweetCellDelegate?
    
    var tweet: Tweet?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func onRetweetButton(sender: UIButton) {
        

        
        retweetButton.selected = true
        self.tweet!.retweetCount! += 1
       self.retweetCountLabel.text = "\(self.tweet!.retweetCount!)"
        
        
        
        
    

    }
    
    
    @IBAction func onFavoriteButton(sender: UIButton) {
    
        likeButton.selected = true
        self.tweet!.favoriteCount! += 1
        self.likeCountLabel.text = "\(self.tweet!.favoriteCount!)"

        
        
        
        
    }
}


