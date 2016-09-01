//
//  ProjectsTableToAddProjectAnimator.swift
//  TimeBoxer
//
//  Created by Tomasz Urbanowicz on 06/03/16.
//  Copyright © 2016 Tomasz Urbanowicz. All rights reserved.
//

import UIKit

class ProjectsTableToAddProjectAnimator: AbstractAnimator {
    private let keyboardAnimationCurveRawValue = UInt(458752)
    
    override init() {
        super.init()
        self.duration = 0.3
        //registerForKeyboardNotifications()
    }
    
    override func doAnimate() {
      // let addProjectVC = toVC! as! AddProjectPageViewController
        toView!.transform = CGAffineTransformMakeTranslation(0, container!.frame.size.height)
        container!.addSubview(toView!)
        let options = UIViewAnimationOptions(rawValue: self.keyboardAnimationCurveRawValue)
        UIView.animateWithDuration(duration, delay:0.0, options: options, animations: {
            self.toView!.transform = CGAffineTransformIdentity
            }, completion: {
                (finished: Bool) -> Void in
                //self.fromVC!.view.removeFromSuperview()
                self.context!.completeTransition(true)
        })
       // addProjectVC.chooseProjectNameVC.projectNameTextField.becomeFirstResponder()
    }
    
//    func registerForKeyboardNotifications() {
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ProjectsTableToAddProjectAnimator.keyboardWillShow(_:)),
//            name: UIKeyboardWillShowNotification, object: nil)
//    }
//    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        print("NO KURWA")
//        let keyboardNotification = KeyboardNotification(notification)
//        self.duration  =  keyboardNotification.animationDuration
//        print(UInt(keyboardNotification.animationCurve << 16))
//        let options = UIViewAnimationOptions(rawValue: UInt(keyboardNotification.animationCurve << 16))
//        
//        UIView.animateWithDuration(duration, delay:0.0, options: options, animations: {
//            self.toView!.transform = CGAffineTransformIdentity
//            }, completion: {
//                (finished: Bool) -> Void in
//                //self.fromVC!.view.removeFromSuperview()
//                self.context!.completeTransition(true)
//        })
//    }
}

