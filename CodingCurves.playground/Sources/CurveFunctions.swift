import AppKit
import CoreGraphics

public func sinewave(context: CGContext, p0: CGPoint, p1: CGPoint, freq: CGFloat, amp: CGFloat) {
    let dx = p1.x - p0.x
    let dy = p1.y - p0.y
    let dist = sqrt(dx * dx + dy * dy)
    let angle = atan2(dy, dx)
    context.saveGState()
    context.translateBy(x: p0.x, y: p0.y)
    context.rotate(by: angle)
    var first = true
    for x in stride(from: 0, to: dist, by: 1.0) {
        let y = sin(x / dist * freq * Double.pi * 2) * amp
        let point = CGPoint(x: x, y: -y)
        if first {
            context.move(to: point)
            first = false
        } else {
            context.addLine(to: point)
        }
    }
    context.strokePath()
    context.restoreGState()
}
