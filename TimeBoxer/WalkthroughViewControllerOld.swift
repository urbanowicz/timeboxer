//
//  WalkthroughViewController.swift
//  TimeBoxer
//
//  Created by Tomasz on 26/10/16.
//  Copyright © 2016 Tomasz. All rights reserved.
//

import UIKit

class WalkthroughViewControllerOld: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dismissButtonPressed(sender: UIButton) {
        let containerVC = parentViewController as! ImprovedContainerViewController
        containerVC.popViewController(FadeInAnimator())
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