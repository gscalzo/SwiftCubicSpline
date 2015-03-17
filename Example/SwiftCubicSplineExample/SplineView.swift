//
//  SplineView.swift
//  SwiftCubicSplineExample
//
//  Created by Giordano Scalzo on 17/03/2015.
//  Copyright (c) 2015 Effective Code. All rights reserved.
//

import UIKit
import SwiftCubicSpline

class SplineView: UIView {
    override func drawRect(rect: CGRect) {
        let currentColor = UIColor.blackColor()
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0);
        CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
        
        let spline = CubicSpline(points: [
            CGPoint(x: 0.0, y: 0.5),
            CGPoint(x: 0.1, y: 0.5),
            CGPoint(x: 0.2, y: 0.7),
            CGPoint(x: 0.4, y: 0.3),
            CGPoint(x: 0.6, y: 0.6),
            CGPoint(x: 0.8, y: 0.4),
            CGPoint(x: 0.9, y: 0.5),
            CGPoint(x: 1.0, y: 0.5)
            ])

        let graphSize = self.bounds.size
        for x in 0 ..< Int(graphSize.height) {
            let y = spline.interpolate(CGFloat(x)/graphSize.height)*graphSize.width
            if x == 0 {
                CGContextMoveToPoint(context, CGFloat(y), CGFloat(x));
            } else {
                CGContextAddLineToPoint(context, CGFloat(y), CGFloat(x));
            }
        }
        CGContextStrokePath(context);
        
    }
}
