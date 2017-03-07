//
//  User.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/27/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: String?
    var screenname: String?
    var profileUrl: NSURL?
    var profilepic: String?
    var backgroundImageURL: String?
    var dictionary: NSDictionary!
    var followersCount: Int?
    var followingCount: Int?
    var tagline: NSString?
    var tweetCount: Int?
    
    var hasBannerImage = true
    
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        let profileUrlString = dictionary["description"] as? String
        if let profileUrlString = profileUrlString { profileUrl = NSURL(string: profileUrlString)
        }
        
        backgroundImageURL = dictionary["profile_banner_url"] as? String
        if backgroundImageURL != nil {
            backgroundImageURL?.appendContentsOf("/600x200")
        } else {
            backgroundImageURL = dictionary["profile_background_image_url_https"] as? String
            hasBannerImage = false
        }
        profilepic = dictionary["profile_image_url_https"] as? String
        followersCount = dictionary["followers_count"] as? Int
        followingCount = dictionary["friends_count"] as? Int
        tagline = dictionary["description"] as? String
        tweetCount = dictionary["statuses_count"] as? Int
}
    
    
    
    static let userDidLogoutNotification = "UserDidLogout"
    
    static var _currentUser: User?
    class var currentUser: User? {
        get {
        
            if _currentUser == nil {
            let defaults = NSUserDefaults.standardUserDefaults()
        
            let userData = defaults.objectForKey("currentUserData") as? NSData
            if let userData = userData {
            let dictionary = try!
                NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
            _currentUser = User(dictionary: dictionary)
          
                }
        }
            return _currentUser
            
    }
        
        set(user){
            _currentUser = user
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user {
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                
                defaults.setObject(data, forKey: "currentUserData")
            }else{
                defaults.setObject(nil, forKey: "currentUserData")
            }

                defaults.synchronize()
        
        }
    }
}