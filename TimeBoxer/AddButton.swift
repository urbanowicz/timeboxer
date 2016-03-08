//
//  AddButton.swift
//  TimeBoxer
//
//  Created by Tomasz Urbanowicz on 10.01.2016.
//  Copyright © 2016 Tomasz Urbanowicz. All rights reserved.
//

import UIKit

class AddButton: AbstractOvalButton {
    var cornerRadius = CGFloat(6.0)
    override func drawFrontLayer(rect: CGRect) {
        let verticalBar = createVerticalBar(rect)
        verticalBar.fill()
        let horizontalBar = createHorizontalBar(rect)
        horizontalBar.fill()
    }
    
    private func createVerticalBar(rect: CGRect) -> UIBezierPath  {
        let barWidth:CGFloat = rect.width * 0.1
        let barHeight:CGFloat = rect.height * 0.3333
        let barX:CGFloat = ((rect.origin.x + rect.width) / 2.0) - (barWidth / 2.0)
        let barY:CGFloat = rect.origin.y + (rect.height - barHeight) / 2.0
        let barRect = CGRect(x:barX, y:barY, width:barWidth, height:barHeight)
        return UIBezierPath(roundedRect: barRect, cornerRadius: cornerRadius)
    }
    
    private func createHorizontalBar(rect: CGRect) -> UIBezierPath {
        let barWidth:CGFloat = rect.width * 0.3333
        let barHeight:CGFloat = rect.height * 0.1
        let barX:CGFloat = ((rect.origin.x + rect.width) / 2.0) - (barWidth / 2.0)
        let barY:CGFloat = rect.origin.y + (rect.height - barHeight) / 2.0
        let barRect = CGRect(x:barX, y:barY, width:barWidth, height:barHeight)
        return UIBezierPath(roundedRect: barRect, cornerRadius: cornerRadius)
    }

}
