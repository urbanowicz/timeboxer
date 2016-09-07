//
//  SetDailyGoalViewController.swift
//  TimeBoxer
//
//  Created by Tomasz Urbanowicz on 30/08/16.
//  Copyright © 2016 Tomasz Urbanowicz. All rights reserved.
//

import UIKit

class SetDailyGoalViewController: UIViewController {
    var delegate:SetDailyGoalPageDelegate?
    
    @IBOutlet weak var backButton: BackButton!
    @IBOutlet weak var setDailyGoalLabel: UILabel!
    @IBOutlet weak var dailyGoalLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var dailyGoalValueLabel: UILabel!
    @IBOutlet weak var okButton: OKButton!
    
    private let sliderValueConverter = SliderOutputToValueConverter(maxValue: 480, resolution: 5)
    private let minutesToTextConverter = MinutesToStringConverter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.almostBlack()
        setupBackButton()
        setupSetDailyGoalLabel()
        setupDailyGoalLabel()
        setupSlider()
        setupDailyGoalValueLabel()
        setupOkButton()
    }
    
    private func setupBackButton() {
        backButton.frontLayerColor = Colors.silver()
        backButton.roundLayerColor = Colors.almostBlack()
    }
    
    private func setupSetDailyGoalLabel() {
        setDailyGoalLabel.font = UIFont(name:"Avenir-Heavy", size: 22)
        setDailyGoalLabel.text = "Set daily goal"
        setDailyGoalLabel.textColor = Colors.silver()
    }
    
    private func setupDailyGoalLabel() {
        dailyGoalLabel.textColor = Colors.silver().withAlpha(0.4)
        dailyGoalLabel.font = UIFont(name: "Avenir Book", size: 12)
        dailyGoalLabel.text = "DAILY GOAL"
    }
    
    private func setupSlider() {
        slider.value = 0.0
        slider.minimumTrackTintColor = Colors.silver()
        slider.maximumTrackTintColor = Colors.silver()
    }
    
    private func setupDailyGoalValueLabel() {
        dailyGoalValueLabel.font = UIFont(name: "Avenir-Heavy", size: 20)
        dailyGoalValueLabel.text = minutesToTextConverter.convert(5)
        dailyGoalValueLabel.textColor = Colors.silver()
    }
    
    private func setupOkButton() {
        okButton.frontLayerColor = Colors.silver()
        okButton.frontLayerStrokeColor = Colors.silver()
        okButton.frontLayerHighlighteStrokeColor = Colors.silver()
        okButton.ovalLayerColor = Colors.almostBlack()
        okButton.ovalLayerHighlightedColor = Colors.almostBlack()
        okButton.borderColor = Colors.silver()
        okButton.borderWidth = 2.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let minutes = sliderValueConverter.convert(Double(sender.value))
        let text = minutesToTextConverter.convert(minutes)
        updateDailyGoalValueLabel(text)
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        delegate?.didPressBackButton()
    }
    @IBAction func okButtonPressed(sender: AnyObject) {
        delegate?.didSetDailyGoal(3600)
    }

    private func updateDailyGoalValueLabel(text:String) {
        if text != dailyGoalValueLabel.text {
            let animation: CATransition = CATransition()
            animation.duration = 0.1
            animation.type = kCATransitionFade
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            dailyGoalValueLabel.layer.addAnimation(animation, forKey: "changeTextTransition")
            dailyGoalValueLabel.text = text
        }
    }

}