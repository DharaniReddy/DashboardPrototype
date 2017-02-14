//
//  CircleView.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 13/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var circleLayer: CAShapeLayer!
    var defaultLayer: CAShapeLayer!
    
    init(frame: CGRect, width: CGFloat, drawColor: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - width)/2, startAngle: CGFloat(0.0) - CGFloat(M_PI/2), endAngle: CGFloat(M_PI * 2.0) - CGFloat(M_PI/2), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer = CAShapeLayer()
        defaultLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        defaultLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        defaultLayer.fillColor = UIColor.clear.cgColor
        
        circleLayer.lineWidth = width
        defaultLayer.lineWidth = width
        
        circleLayer.strokeColor = drawColor.cgColor //UIColor(red: 1, green: 130/255, blue: 0, alpha: 1.0).cgColor
        defaultLayer.strokeColor = UIColor(red: 0, green: 0, blue: 0.1, alpha: 0.05).cgColor
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0
        defaultLayer.strokeEnd = 1.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
        layer.addSublayer(defaultLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateCircle(duration: TimeInterval, toValue: CGFloat) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = toValue
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = toValue
        
        // Do the actual animation
        circleLayer.add(animation, forKey: "animateCircle")
    }
}
