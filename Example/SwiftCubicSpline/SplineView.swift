//
//  SplineView.swift
//  SwiftCubicSplineExample
//
//  Created by Giordano Scalzo on 06/03/2020.
//  Copyright (c) 2020 Effective Code. All rights reserved.
//

import UIKit
import SwiftCubicSpline

class SplineView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.black.cgColor);
        
        let spline = CubicSpline(points: [
            Point(x: 0.0, y: 0.5),
            Point(x: 0.1, y: 0.5),
            Point(x: 0.2, y: 0.7),
            Point(x: 0.4, y: 0.3),
            Point(x: 0.6, y: 0.6),
            Point(x: 0.8, y: 0.4),
            Point(x: 0.9, y: 0.5),
            Point(x: 1.0, y: 0.5)
            ])

        let graphSize = self.bounds.size
        for y in 0 ..< Int(graphSize.height) {
            let y = Double(y)
            let x = spline[x: y/Double(graphSize.height)] * Double(graphSize.width)
            
            if y == 0 {
                context.move(to: CGPoint(x: x, y: y))
            } else {
                context.addLine(to: CGPoint(x: x, y: y))
            }
        }
        context.strokePath()
    }
}
