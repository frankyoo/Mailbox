//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Frank Yoo on 2/19/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {
    
    var messageOriginalCenter: CGPoint!
    var laterImageOriginalCenter: CGPoint!
    var archiveImageOriginalCenter: CGPoint!

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var singleMessageView: UIView!
    @IBOutlet weak var backgroundMessageView: UIView!
    @IBOutlet weak var archiveImageView: UIImageView!
    @IBOutlet weak var laterImageView: UIImageView!
    @IBOutlet weak var deleteImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var listView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        feedScrollView.contentSize = CGSize(width: 320, height: 1432)
        feedScrollView.frame.size = CGSize(width: 320, height: 568)
        
        self.scheduleView.alpha = 0
        self.listView.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(singleMessageView)
        let point = sender.locationInView(singleMessageView)
        let velocity = sender.velocityInView(singleMessageView)
        
        self.laterImageView.alpha = 0.5
        self.listImageView.alpha = 0
        self.archiveImageView.alpha = 0.5
        self.deleteImageView.alpha = 0
        self.backgroundMessageView.backgroundColor = UIColor.init(red: 226/255.0, green: 226/255.0, blue: 226/255.0, alpha: 1.0)
        
        if sender.state == UIGestureRecognizerState.Began {
//            print("Began - Translation: \(translation.x)")

            messageOriginalCenter = singleMessageView.center
            laterImageOriginalCenter = laterImageView.center
            archiveImageOriginalCenter = archiveImageView.center
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
//            print("Changed - Translation: \(translation.x)")
            
            singleMessageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            laterImageView.center = CGPoint(x: laterImageView.center.x, y: laterImageView.center.y)
            archiveImageView.center = CGPoint(x: archiveImageView.center.x, y: archiveImageView.center.y)
            
            if translation.x < -60 && translation.x > -200 {
                self.backgroundMessageView.backgroundColor = UIColor.init(red: 250/255.0, green: 211/255.0, blue: 51/255.0, alpha: 1.0)
                self.laterImageView.alpha = 1
                self.listImageView.alpha = 0
                self.archiveImageView.alpha = 0
                self.deleteImageView.alpha = 0
                
                laterImageView.center = CGPoint(x: singleMessageView.center.x + 187, y: messageOriginalCenter.y)
                
            } else if translation.x < -200 {
                self.backgroundMessageView.backgroundColor = UIColor.init(red: 216/255.0, green: 165/255.0, blue: 117/255.0, alpha: 1.0)
                self.laterImageView.alpha = 0
                self.listImageView.alpha = 1
                self.archiveImageView.alpha = 0
                self.deleteImageView.alpha = 0
                
                listImageView.center = CGPoint(x: singleMessageView.center.x + 180, y: messageOriginalCenter.y)
                
            } else if translation.x > 60 && translation.x < 200 {
                self.backgroundMessageView.backgroundColor = UIColor.init(red: 112/255.0, green: 217/255.0, blue: 98/255.0, alpha: 1.0)
                self.laterImageView.alpha = 0
                self.listImageView.alpha = 0
                self.archiveImageView.alpha = 1
                self.deleteImageView.alpha = 0
                
                archiveImageView.center = CGPoint(x: singleMessageView.center.x - 187, y: messageOriginalCenter.y)
                
            } else if translation.x > 200 {
                self.backgroundMessageView.backgroundColor = UIColor.init(red: 235/255.0, green: 84/255.0, blue: 51/255.0, alpha: 1.0)
                self.laterImageView.alpha = 0
                self.listImageView.alpha = 0
                self.archiveImageView.alpha = 0
                self.deleteImageView.alpha = 1
                
                deleteImageView.center = CGPoint(x: singleMessageView.center.x - 180, y: messageOriginalCenter.y)
            }

        } else if sender.state == UIGestureRecognizerState.Ended {

            let velocity = sender.velocityInView(view)
            
            if translation.x < -200 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.backgroundMessageView.backgroundColor = UIColor.init(red: 216/255.0, green: 165/255.0, blue: 117/255.0, alpha: 1.0)
                    self.laterImageView.alpha = 0
                    self.listImageView.alpha = 0
                    self.archiveImageView.alpha = 0
                    self.deleteImageView.alpha = 0
                    
                    self.singleMessageView.center = CGPoint(x: self.messageOriginalCenter.x - 320, y: self.messageOriginalCenter.y)
                    
                    self.listView.alpha = 1
                    
                    }, completion: { (Bool) -> Void in
                })
                
            } else if translation.x > 200 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.backgroundMessageView.backgroundColor = UIColor.init(red: 235/255.0, green: 84/255.0, blue: 51/255.0, alpha: 1.0)
                    self.laterImageView.alpha = 0
                    self.listImageView.alpha = 0
                    self.archiveImageView.alpha = 0
                    self.deleteImageView.alpha = 0
                    
                    self.singleMessageView.center = CGPoint(x: self.messageOriginalCenter.x + 320, y: self.messageOriginalCenter.y)
                    
                    }, completion: { (Bool) -> Void in
                        
                        // Scroll the scrollview up
                        UIView.animateWithDuration(0.2, animations: { () -> Void in

                            self.feedScrollView.frame.origin.y = self.feedScrollView.frame.origin.y - 86
                            
                        })
                })
                
            } else if translation.x < -60 && translation.x > -200 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    
                    self.backgroundMessageView.backgroundColor = UIColor.init(red: 250/255.0, green: 211/255.0, blue: 51/255.0, alpha: 1.0)
                    
                    self.laterImageView.alpha = 0
                    self.listImageView.alpha = 0
                    self.archiveImageView.alpha = 0
                    self.deleteImageView.alpha = 0
                    
                    self.singleMessageView.center = CGPoint(x: self.messageOriginalCenter.x - 320, y: self.messageOriginalCenter.y)
                    
                    self.scheduleView.alpha = 1
                    }, completion: { (Bool) -> Void in
                })
                
            } else if translation.x > 60 && translation.x < 200 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    
                    self.backgroundMessageView.backgroundColor = UIColor.init(red: 112/255.0, green: 217/255.0, blue: 98/255.0, alpha: 1.0)
                    
                    self.laterImageView.alpha = 0
                    self.listImageView.alpha = 0
                    self.archiveImageView.alpha = 0
                    self.deleteImageView.alpha = 0
                    
                    self.singleMessageView.center = CGPoint(x: self.messageOriginalCenter.x + 320, y: self.messageOriginalCenter.y)

                    }, completion: { (Bool) -> Void in
                })
                
            } else {
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: { () -> Void in
                    self.singleMessageView.center = self.messageOriginalCenter
                    }, completion: { (Bool) -> Void in
                })
                
                laterImageView.center = laterImageOriginalCenter
                archiveImageView.center = archiveImageOriginalCenter
                
                self.laterImageView.alpha = 0.5
                self.listImageView.alpha = 0
                self.archiveImageView.alpha = 0.5
                self.deleteImageView.alpha = 0
            }
            
        }
    }

    @IBAction func didPressSchedule(sender: AnyObject) {
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.scheduleView.alpha = 0
        })
    }
    @IBAction func didPressList(sender: AnyObject) {
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.listView.alpha = 0
        })
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
