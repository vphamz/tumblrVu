//
//  TabBarViewController.swift
//  tumblrVu
//
//  Created by Vuhuan Pham on 3/4/15.
//  Copyright (c) 2015 Vuhuan Pham. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    let homeButton_default = UIImage(named: "home_icon")
    let homeButton_selected = UIImage(named: "home_selected_icon")
    let searchButton_default = UIImage(named: "search_icon")
    let searchButton_selected = UIImage(named: "search_selected_icon")
    let accountButton_default = UIImage(named: "account_icon")
    let accountButton_selected = UIImage(named: "account_selected_icon")
    let trendingButton_default = UIImage(named: "trending_icon")
    let trendingButton_selected = UIImage(named: "trending_selected_icon")
    
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewController: ComposeViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!
    
    var selectedButton: UIButton!
    var selectedViewController: UIViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeButton.setImage(homeButton_default, forState: .Normal)
        homeButton.setImage(homeButton_selected, forState: .Highlighted)
        homeButton.setImage(homeButton_selected, forState: UIControlState.Selected)
        
        searchButton.setImage(searchButton_default, forState: .Normal)
        searchButton.setImage(searchButton_selected, forState: .Highlighted)
        searchButton.setImage(searchButton_selected, forState: UIControlState.Selected)
        
        accountButton.setImage(accountButton_default, forState: .Normal)
        accountButton.setImage(accountButton_selected, forState: .Highlighted)
        accountButton.setImage(accountButton_selected, forState: UIControlState.Selected)
        
        trendingButton.setImage(trendingButton_default, forState: .Normal)
        trendingButton.setImage(trendingButton_selected, forState: .Highlighted)
        trendingButton.setImage(trendingButton_selected, forState: UIControlState.Selected)
        
        
        homeViewController = storyboard!.instantiateViewControllerWithIdentifier("homeView") as HomeViewController
        searchViewController = storyboard!.instantiateViewControllerWithIdentifier("searchView") as SearchViewController
        composeViewController = storyboard!.instantiateViewControllerWithIdentifier("composeView") as ComposeViewController
        accountViewController = storyboard!.instantiateViewControllerWithIdentifier("accountView") as AccountViewController
        trendingViewController = storyboard!.instantiateViewControllerWithIdentifier("trendingView") as TrendingViewController
        
        selectedButton = searchButton
        selectedViewController = searchViewController
        
        addChildViewController(selectedViewController)
        selectedViewController.view.frame = contentView.frame
        contentView.addSubview(selectedViewController.view)
        selectedViewController.didMoveToParentViewController(self)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressTabButton(sender: UIButton) {
        
        selectedButton = sender
        
        
        
        if (selectedButton == homeButton) {
            selectedViewController.view.removeFromSuperview()
            selectedViewController = homeViewController
            
            
            
        } else if (selectedButton == searchButton) {
            selectedViewController.view.removeFromSuperview()
            selectedViewController = searchViewController
        } else if (selectedButton == composeButton) {
            selectedViewController = composeViewController
        } else if (selectedButton == accountButton) {
            selectedViewController.view.removeFromSuperview()
            selectedViewController = accountViewController
        } else if (selectedButton == trendingButton) {
            selectedViewController.view.removeFromSuperview()
            selectedViewController = trendingViewController
        }
        
        
        addChildViewController(selectedViewController)
        selectedViewController.view.frame = contentView.frame
        contentView.addSubview(selectedViewController.view)
        selectedViewController.didMoveToParentViewController(self)
        
        
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
