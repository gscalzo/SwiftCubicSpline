//
//  CubicSpline.swift
//  Pods
//
//  Created by Giordano Scalzo on 07/03/2020.
//
//

#if os(Linux)
import Glibc
#else
import Darwin.C
#endif

public struct Point {
    public let x: Double
    public let y: Double
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

public class CubicSpline{

    private var x: [Double]
    private var a: [Double]
    private var b: [Double]
    private var c: [Double]
    private var d: [Double]
    
    public convenience init(points: [Point]){
        var x = [Double]()
        var y = [Double]()
        
        for point in points {
            x.append(Double(point.x))
            y.append(Double(point.y))
        }
        self.init(x: x, y: y)
    }
    
    public init(x: [Double], y: [Double]){
        assert(x.count == y.count, "Number of X points should be the same as Y points")
        
        let count: Int = x.count
        
        self.x = x
        self.a = y
        
        self.b = [Double](repeating: 0.0, count: count)
        self.c = [Double](repeating: 0.0, count: count)
        self.d = [Double](repeating: 0.0, count: count)
        
        guard count > 0 else { return }
        
        let n: Int = count - 1
        var h = [Double](repeating: 0.0, count: count)
        var y = [Double](repeating: 0.0, count: count)
        var l = [Double](repeating: 0.0, count: count)
        var u = [Double](repeating: 0.0, count: count)
        var z = [Double](repeating: 0.0, count: count)
        var k = [Double](repeating: 0.0, count: count)
        var s = [Double](repeating: 0.0, count: count)
        
        for i in 0..<n {
            h[i] = x[i + 1] - x[i]
            k[i] = a[i + 1] - a[i]
            s[i] = k[i] / h[i]
        }
        
        for i in 1..<n {
            y[i] = 3 / h[i] * (a[i + 1] - a[i]) - 3 / h[i - 1] * (a[i] - a[i - 1])
        }
        
        l[0] = 1
        u[0] = 0
        z[0] = 0
        
        for i in 1..<n {
            let temp: Double = 2 * (x[i + 1] - x[i - 1])
            l[i] = temp - h[i - 1] * u[i - 1]
            u[i] = h[i] / l[i]
            z[i] = (y[i] - h[i - 1] * z[i - 1]) / l[i]
        }
        
        l[n] = 1
        z[n] = 0
        
        var i = n - 1
        while i >= 0 {
            c[i] = z[i] - u[i] * c[i + 1]
            
            let aDiff: Double = a[i + 1] - a[i]
            let temp: Double = c[i + 1] + 2.0 * c[i]
            
            b[i] = aDiff / h[i] - h[i] * temp / 3.0
            d[i] = (c[i + 1] - c[i]) / (3 * h[i])
            i -= 1
        }
        
        c[n] = 0
        
    }
    
    public subscript(x input: Double) -> Double {
        guard x.count > 0 else { return input }
        
        var i: Int = x.count - 1
        
        while i > 0 {
            if x[i] <= input {
                break
            }
            i -= 1
        }
        
        let deltaX: Double = input - x[i]
        let af: Double = b[i]
        let cf: Double = c[i]
        let df: Double = d[i]
        return a[i] + af * deltaX + cf * pow(deltaX, 2) + df * pow(deltaX, 3)
    }
}
