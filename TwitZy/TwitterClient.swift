//
//  TwitterClient.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/28/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    
 //   let client = TwitterClient.sharedInstance
    
    
    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://www.api.twitter.com")!, consumerKey: "4BxkRGAEqVbnRPgCjgWfZ72GG", consumerSecret: "10ChvIFiym05z3dBg90NGTj98zPVO2H0la34PvQS7TYgBHb6DJ")
    
    var loginSuccess: (() -> ())?
    var loginFailure: ((NSError) -> ())?
    
    func login(success: () -> (), failure: (NSError) -> ()){
        
        loginSuccess = success
        loginFailure = failure
        
        TwitterClient.sharedInstance.deauthorize()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("https://api.twitter.com/oauth/request_token", method: "GET", callbackURL: NSURL(string: "TwitZy://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print("I GOT A TOKEN!")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            UIApplication.sharedApplication().openURL(url)
            
            
        }) { (error: NSError!) -> Void in
            print("error: \(error.localizedDescription)")
            self.loginFailure?(error)
            
        }
    
    }
    
    
   /* class func userTweets(tweetcontents: String, success: () -> (), failure: (NSError) ->  ()){
        
        TwitterClient.sharedInstance.GET("https://api.twitter.com/1.1/statuses/user_timeline.json", parameters: ["status": tweetcontents], progress: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            success()
            //let dictionaries = response as! [NSDictionary]
            //let status =
            
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                failure(error)
        })
        
        
    }*/

    
    
   func retweetStatusWithParams(params: NSDictionary, completion: (tweet: Tweet?, error: NSError?) -> Void) {
        POST("https://api.twitter.com/1.1/statuses/retweet/:id.json",
             parameters: params,
             progress: nil,
             success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
                completion(tweet: Tweet.init(dictionary: response as! NSDictionary), error: nil)
            },
             failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                print("Error retweeting status.")
            }
        )
    }
    
    func favoritesCreateWithParams(params: NSDictionary, completion: (tweet: Tweet?, error: NSError?) -> Void) {
        POST("https://api.twitter.com/1.1/favorites/create.json",
             parameters: params,
             progress: nil,
             success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
                // print("\(response)")
                completion(tweet: Tweet.init(dictionary: response as! NSDictionary), error: nil)
            },
             failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                print("Error favoriting tweet.")
            }
        )
    }

    
    
    
    class func Post(tweetcontents: String, success: () -> (), failure: (NSError) ->  ()){
        
        TwitterClient.sharedInstance.POST("https://api.twitter.com/1.1/statuses/update.json", parameters: ["status": tweetcontents], progress: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            success()
            //let dictionaries = response as! [NSDictionary]
            //let status =
            
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                failure(error)
        })

    
    }
    
    
    
    
    
    func logout(){
        User.currentUser = nil
        deauthorize()
        
        
        NSNotificationCenter.defaultCenter().postNotificationName(User.userDidLogoutNotification, object: nil)
    
    }
    
    
    func handleOpenUrl(url: NSURL){
        
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        
        TwitterClient.sharedInstance.fetchAccessTokenWithPath("https://api.twitter.com/oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential!) in
            
            
            self.currentAccount({ (user: User) in
                    User.currentUser = user
                    self.loginSuccess?()
                }, failure: { (error: NSError) in
                    self.loginFailure?(error)
            })
            
        }) { (error: NSError!) in
            print("error: \(error.localizedDescription)")
            
            self.loginFailure?(error)
        }
    
    }
    
    
    
    func homeTimeline(success: ([Tweet]) -> (), failure: (NSError) ->  ()){
        
        TwitterClient.sharedInstance.GET("https://api.twitter.com/1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            let dictionaries = response as! [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dictionaries)
            
             success(tweets)
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
             failure(error)
        })
        
    }
    
    
    func currentAccount(success: (User) -> (), failure: (NSError) -> ()) {
    
        TwitterClient.sharedInstance.GET("https://api.twitter.com/1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            //print("account: \(response)")
            let userDictionary  = response as! NSDictionary
            let user = User(dictionary: userDictionary)
            
            success(user)
            
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                failure(error)
        })

    }
    
        
    
}
