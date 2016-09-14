//
//  ProjectSettingsViewController.swift
//  TimeBoxer
//
//  Created by Tomasz on 14/09/16.
//  Copyright © 2016 Tomasz. All rights reserved.
//

import UIKit

class ProjectSettingsViewController: UIViewController {

    @IBOutlet weak var xButton: XButton!
    @IBOutlet weak var projectSettingsLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    
    @IBOutlet weak var editProjectNameLabel: UILabel!
    @IBOutlet weak var editProjectNameUnderline: UIView!
    
    @IBOutlet weak var changeDailyGoalLabel: UILabel!
    @IBOutlet weak var changeDailyGoalUnderline: UIView!
    
    
    @IBOutlet weak var deleteProjectLabel: UILabel!
    @IBOutlet weak var deleteProjectUnderline: UIView!
    
    @IBOutlet weak var markAsFinishedLabel: UILabel!
    @IBOutlet weak var markAsFinishedUnderline: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.almostBlack()
        setupXButton()
        setupProjectSettingsLabel()
        setupProjectNameLabel()
        setupEditProjectNameLabel()
        setupChangeDailyGoalLabel()
        setupDeleteProjectLabel()
        setupMarkAsFinishedLabel()
        setupUnderlines()
        
        // Do any additional setup after loading the view.
    }

    private func setupXButton() {
        xButton.borderWidth = 0.0
        xButton.frontLayerColor = Colors.silver()
        xButton.roundLayerColor = Colors.almostBlack()
    }
    
    private func setupProjectSettingsLabel() {
        projectSettingsLabel.font = UIFont(name:"Avenir-Heavy", size: 24)
        projectSettingsLabel.text = "Project settings"
        projectSettingsLabel.textColor = Colors.silver()
        projectSettingsLabel.backgroundColor = Colors.almostBlack()
    }
    
    private func setupProjectNameLabel() {
        projectNameLabel.font = UIFont(name:"Avenir-Medium", size:16)
        projectNameLabel.numberOfLines = 0
        projectNameLabel.textColor = Colors.silver().withAlpha(0.7)
        projectNameLabel.backgroundColor = Colors.almostBlack()
        projectNameLabel.text = "Read On Intelligence"
    }
    
    private func setupEditProjectNameLabel() {
        editProjectNameLabel.font = UIFont(name:"Avenir-Heavy", size: 18)
        editProjectNameLabel.text = "Edit project name"
        editProjectNameLabel.textColor = Colors.silver()
        editProjectNameLabel.backgroundColor = Colors.almostBlack()
    }
    
    private func setupChangeDailyGoalLabel() {
        changeDailyGoalLabel.font = UIFont(name:"Avenir-Heavy", size: 18)
        changeDailyGoalLabel.text = "Change daily goal"
        changeDailyGoalLabel.textColor = Colors.silver()
        changeDailyGoalLabel.backgroundColor = Colors.almostBlack()
    }
    
    private func setupDeleteProjectLabel() {
        deleteProjectLabel.font = UIFont(name:"Avenir-Heavy", size: 18)
        deleteProjectLabel.text = "Delete project"
        deleteProjectLabel.textColor = Colors.silver()
        deleteProjectLabel.backgroundColor = Colors.almostBlack()
    }
    
    private func setupMarkAsFinishedLabel() {
        markAsFinishedLabel.font = UIFont(name:"Avenir-Heavy", size: 18)
        markAsFinishedLabel.text = "Mark as finished"
        markAsFinishedLabel.textColor = Colors.silver()
        markAsFinishedLabel.backgroundColor = Colors.almostBlack()
    }
    
    private func setupUnderlines() {
        editProjectNameUnderline.backgroundColor = Colors.silver()
        changeDailyGoalUnderline.backgroundColor = Colors.silver()
        deleteProjectUnderline.backgroundColor = Colors.silver()
        markAsFinishedUnderline.backgroundColor = Colors.silver()
    }
    
    @IBAction func xButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("unwindToProjectsTable", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Hide status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
