//: [Previous](@previous)

import Cocoa

/*
 This is a playground based on the Coding Curves series of articles at
 https://www.bit-101.com/blog/2022/11/coding-curves/
 */

//: # The Format

let redSlope = NSImage(size: NSSize(width: 800, height: 800), flipped: true) { rect in
    let graphicsContext = NSGraphicsContext.current!
    let context = graphicsContext.cgContext
    context.setLineWidth(5)
    context.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
    context.move(to: CGPoint(x: 100, y: 100))
    context.addLine(to: CGPoint(x: 700, y: 700))
    context.strokePath()
    return true
}


let fooCall = NSImage(size: NSSize(width: 500, height: 100), flipped: true) { rect in
    let graphicsContext = NSGraphicsContext.current!
    let context = graphicsContext.cgContext
    foo(context: context, count: 100)
    return true
}

func foo(context: CGContext, count: Int) {
    for i in 0 ..< count {
        context.move(to: CGPoint(x: i * 10, y: 10))
        context.addLine(to: CGPoint(x: i * 10, y: 90))
    }
    context.strokePath()
}

//: [Next](@next)
