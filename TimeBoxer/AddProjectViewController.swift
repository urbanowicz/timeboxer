//
//  AddProjectViewController.swift
//  TimeBoxer
//
//  Created by Tomasz Urbanowicz on 07.01.2016.
//  Copyright © 2016 Tomasz Urbanowicz. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var xButton: XButton!
    @IBOutlet weak var newProjectLabel: UILabel!
    @IBOutlet weak var titleBar: TitleBar!
    @IBOutlet weak var projectNameTextField: UITextField!
    @IBOutlet weak var lineSeparator: UIView!
    @IBOutlet weak var projectNameLabel: UILabel!
    
    @IBOutlet weak var projectNameTextFieldCenterYConstraint: NSLayoutConstraint!
    var projectName:String?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        setupTitleBar()
        setupNewProjectLabel()
        setupXButton()
        setupProjectNameTextField()
        setupLineSeparator()
        setupProjectNameLabel()
    }
    
    override func viewDidAppear(animated: Bool) {
        projectNameTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func registerForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification, object: nil)
    }
    
//MARK: Setup UI Elements
    
    private func setupTitleBar() {
        titleBar.fillColor = Colors.purple()
        titleBar.cornerRadius = 6.0
    }

    private func setupNewProjectLabel() {
        newProjectLabel.textColor = Colors.offWhite()
    }
    
    private func setupXButton() {
        xButton.borderWidth = 0.0
        xButton.strokeWidth = 1.5
        xButton.ovalLayerColor = Colors.offWhite()
        xButton.frontLayerStrokeColor = Colors.purple()
        xButton.ovalLayerHighlightedColor = Colors.purple()
        xButton.frontLayerHighlighteStrokeColor = Colors.offWhite()
    }
    private func setupProjectNameTextField() {
        projectNameTextField.delegate = self
        projectNameTextField.textColor = Colors.almostBlack()
        projectNameTextField.adjustsFontSizeToFitWidth = true
    }
    private func setupLineSeparator() {
        lineSeparator.backgroundColor = Colors.kindOfGray()
    }
    private func setupProjectNameLabel() {
        projectNameLabel.textColor = Colors.kindOfGray()
    }
//MARK: Keyboard Will Show
    func keyboardWillShow(notification: NSNotification) {
        let keyboardNotification = KeyboardNotification(notification)
        let keyboardFrame = keyboardNotification.frameEndForView(self.view)
        projectNameTextFieldCenterYConstraint.constant = projectNameTextFieldCenterYConstraint.constant -
            keyboardFrame.height/2.0 + titleBar.frame.height/2.0
    }

//MARK: UITextFieldDelegate

    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        //textField.resignFirstResponder()
        performSegueWithIdentifier("ProjectAddedUnwind", sender: self)
        return true
    }


    func textFieldDidEndEditing(textField: UITextField)
    {
        projectName = projectNameTextField!.text
        
    }


//MARK: Status Bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.LightContent
    }
    
}
