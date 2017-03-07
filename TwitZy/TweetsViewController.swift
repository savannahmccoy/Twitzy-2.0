//
//  TweetsViewController.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/28/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit
import AFNetworking
import BDBOAuth1Manager
import DateTools

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var isMoreDataLoading = false
    var refreshControl = UIRefreshControl()
    var tweets: [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
       
        
        self.getTimeline()
        
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    func getTimeline() {
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            
            self.tweets = tweets
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.isMoreDataLoading = false
            
            for tweet in tweets{
                print(tweet.author?.screenname)
            }
            
            }, failure: { (error: NSError) -> Void in
                print(error.localizedDescription)
        })
    }
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        self.getTimeline()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getTimeline()
        
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Handle scroll behavior here
        
        if (!isMoreDataLoading) {
            
            let scrollViewContentHeight = tableView.contentSize.height
            let scrollOffsetThreshold = scrollViewContentHeight - tableView.bounds.size.height
            
            // When the user has scrolled past the threshold, start requesting
            if(scrollView.contentOffset.y > scrollOffsetThreshold && tableView.dragging) {
            
            isMoreDataLoading = true
                
                getTimeline()
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetTableViewCell", forIndexPath: indexPath) as! TweetTableViewCell
        let row = indexPath.row
        let tweet = tweets[row]
        print(indexPath.row)
        
        cell.tweet = tweet
        
        cell.usernameLabel.text = tweet.author!.name
        cell.tweetTextLabel.text = tweet.text
        cell.handleLabel.text = tweet.author?.screenname
        cell.timeStampLabel.text = tweet.timeStamp!.shortTimeAgoSinceNow()
        
        cell.userImageView.setImageWithURL((NSURL(string: (tweet.author?.profilepic)!))!)
        
        cell.profileButton.tag = indexPath.row
        
        print("favorite count: \(tweet.favoriteCount)")
        cell.likeCountLabel.text = "\(tweet.favoriteCount)"
        cell.retweetCountLabel.text = "\(tweet.retweetCount)"
        
        print("\(cell.profileButton.tag)")
        
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "detailSegue" {
            
            
            
            let destinationVC:TweetsDetailViewController = segue.destinationViewController as! TweetsDetailViewController
            
            
            destinationVC.tweetss = tweets
            
            storyboard!.instantiateViewControllerWithIdentifier("DetailsViewController") as! TweetsDetailViewController
            
            
        }
        
        
        if segue.identifier == "otherUserProfileSegue"{
         
            let destinationVC:OtherProfileViewController = segue.destinationViewController as! OtherProfileViewController
            
            let button = sender as! ProfileButton
            let tweet = tweets[button.tag]
            
            destinationVC.tweet = tweet
            
            
            //storyboard!.instantiateViewControllerWithIdentifier("OtherProfileViewController") as! TweetsDetailViewController
        
        
        
        }
        
    }

}
