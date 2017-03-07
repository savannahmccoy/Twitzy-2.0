//
//  Tweet.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/27/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var id: String? = nil
    var text: String?
    var timeStamp: NSDate?
    var retweetCount: Int!
    var favoriteCount: Int!
    var author: User?
    var createdAt: NSDate?
    var tweetRetweetCount: Int!
    var tweetFavoriteCount: Int!
    var retweetedStatus: NSDictionary?
    var retweeted: Bool!
    var favorited: Bool!
    var user: User!
    
    
    init(id: String? = nil, text: String, author: User, createdAt: NSDate) {
        self.id = id
        self.text = text
        self.author = author
        self.createdAt = createdAt

    }

    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? String
        
        let timeStampString = dictionary["created_at"]
        
        if let timeStampString = timeStampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EE MMM d HH:mm:ss Z y"
            timeStamp = formatter.dateFromString(timeStampString as! String)!
           
            retweetCount = dictionary["retweet_count"] as? Int
            
            if let retweetedStatus = dictionary["retweeted_status"] as? NSDictionary {
                favoriteCount = retweetedStatus["favorite_count"] as? Int
            } else {
                favoriteCount = dictionary["favorite_count"] as? Int
            }
            retweeted = dictionary["retweeted"] as? Bool
            favorited = dictionary["favorited"] as? Bool
    
            
        }else {
        
            print("no time")
            
        }
        
        
        
        let userDictionary = dictionary["user"] as? NSDictionary
        
        author = User(dictionary: userDictionary!)
    }
    

    
   
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
        }
        return tweets
    }

}
