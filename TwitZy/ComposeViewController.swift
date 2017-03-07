//
//  ComposeViewController.swift
//  TwitZy
//
//  Created by Savannah McCoy on 6/29/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var didPressTweetButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tweetTextView.delegate = self
        self.updateCharacterCount()
        // Do any additional setup after loading the view.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func composeCancelAction(sender: AnyObject) {
    
    dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    
    
    
    func updateCharacterCount() {
        self.countdownLabel.text = "\((140) - self.tweetTextView.text.characters.count)"
    }
    
    
    
    
    
    func textViewDidChange(textView: UITextView) {
        self.updateCharacterCount()
    }
    
    
    @IBAction func didPressTweet(sender: UIButton) {
        
        TwitterClient.Post(tweetTextView.text, success: {
            print("YAY!!")
            self.dismissViewControllerAnimated(true, completion: nil)
            }) { (error) in
                print(error)
                print("An error occured while posting tweet")
        }
        
        
                
    }
    
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        self.updateCharacterCount()
        return textView.text.characters.count +  (text.characters.count - range.length) <= 140
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
