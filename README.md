# SwiftCubicSpline

[![CI Status](http://img.shields.io/travis/gscalzo/SwiftCubicSpline.svg?style=flat)](https://travis-ci.org/gscalzo/SwiftCubicSpline)
[![Version](https://img.shields.io/cocoapods/v/SwiftCubicSpline.svg?style=flat)](http://cocoadocs.org/docsets/SwiftCubicSpline)
[![License](https://img.shields.io/cocoapods/l/SwiftCubicSpline.svg?style=flat)](http://cocoadocs.org/docsets/SwiftCubicSpline)
[![Platform](https://img.shields.io/cocoapods/p/SwiftCubicSpline.svg?style=flat)](http://cocoadocs.org/docsets/SwiftCubicSpline)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftCubicSpline is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "SwiftCubicSpline"

## Example

```swift
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
```

![screenshot](https://github.com/gscalzo/SwiftCubicSpline/blob/master/vertical_screenshot.png)

## Author

giordano scalzo, giordano.scalzo@gmail.com

## Credits

Based on [SAMCubicSpline](https://github.com/soffes/SAMCubicSpline) and [CubicSpline](https://github.com/vkaramov/CubicSpline)

## License

SwiftCubicSpline is available under the MIT license. See the LICENSE file for more info.
