//
//  CubicSpline.swift
//  Pods
//
//  Created by Giordano Scalzo on 17/03/2015.
//
//

import SAMCubicSpline

public class CubicSpline{
    private let samCubicSpline: SAMCubicSpline
    public init(points: [CGPoint]){
        samCubicSpline = SAMCubicSpline(points: points.map{ p in NSValue(cgPoint:p)})
    }
    
    public func interpolate(x: CGFloat) -> CGFloat {
        return CGFloat(samCubicSpline.interpolate(x))
    }
}
