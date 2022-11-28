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

public func _circle(context: CGContext, center: CGPoint, radius: CGFloat) {
    let res = 4.0 / radius
    var first = true
    for t in stride(from: 0, to: Double.pi * 2, by: res) {
        let point = CGPoint(x: center.x + cos(t) * radius, y: center.y + sin(t) * radius)
        if first {
            first = false
            context.move(to: point)
        } else {
            context.addLine(to: point)
        }
    }
    context.closePath()
}

public func _arc(context: CGContext, center: CGPoint, radius: CGFloat, start: CGFloat, end: CGFloat) {
    let res = 4.0 / radius
    var first = true
    for t in stride(from: start, to: end, by: res) {
        let point = CGPoint(x: center.x + cos(t) * radius, y: center.y + sin(t) * radius)
        if first {
            first = false
            context.move(to: point)
        } else {
            context.addLine(to: point)
        }
    }
}

public func arc(context: CGContext, center: CGPoint, radius: CGFloat, start: CGFloat, end: CGFloat) {
    let res = 4.0 / radius
    var end = end
    while end < start {
        end += Double.pi * 2
    }
    var first = true
    for t in stride(from: start, to: end, by: res) {
        let point = CGPoint(x: center.x + cos(t) * radius, y: center.y + sin(t) * radius)
        if first {
            first = false
            context.move(to: point)
        } else {
            context.addLine(to: point)
        }
    }
}

public func arc(
    context: CGContext,
    center: CGPoint,
    radius: CGFloat,
    start: CGFloat,
    end: CGFloat,
    anticlockwise: Bool
) {
    let res = 4.0 / radius
    var start = start
    var end = end
    if anticlockwise {
        (start, end) = (end, start)
    }
    while end < start {
        end += Double.pi * 2
    }
    var first = true
    for t in stride(from: start, to: end, by: res) {
        let point = CGPoint(x: center.x + cos(t) * radius, y: center.y + sin(t) * radius)
        if first {
            first = false
            context.move(to: point)
        } else {
            context.addLine(to: point)
        }
    }
}

public func circle(context: CGContext, center: CGPoint, radius: CGFloat) {
    // anticlockwise here false instead of true as in the example. If it's false, then
    // with these parameters it'll end up as start: 2 * Double.pi, end: 0, then
    // end will be incremented to 2 * Double.pi too and you'll get nothing on screen.
    arc(context: context, center: center, radius: radius, start: 0, end: 2 * Double.pi, anticlockwise: false)
}

public func segment(
    context: CGContext,
    center: CGPoint,
    radius: CGFloat,
    start: CGFloat,
    end: CGFloat,
    anticlockwise: Bool
) {
    arc(context: context, center: center, radius: radius, start: start, end: end, anticlockwise: anticlockwise)
    context.closePath()
}

public func sector(
    context: CGContext,
    center: CGPoint,
    radius: CGFloat,
    start: CGFloat,
    end: CGFloat,
    anticlockwise: Bool
) {
    arc(context: context, center: center, radius: radius, start: start, end: end, anticlockwise: anticlockwise)
    context.addLine(to: center)
    context.closePath()
}

public func polygon(context: CGContext, center: CGPoint, radius: CGFloat, sides: Int, rotation: CGFloat = 0.0) {
    let res = Double.pi * 2.0 / Double(sides)
    var first = true
    for i in stride(from: 0, to: Double.pi * 2.0, by: res) {
        let point = CGPoint(x: center.x + cos(i + rotation) * radius, y: center.y + sin(i + rotation) * radius)
        if first {
            first = false
            context.move(to: point)
        } else {
            context.addLine(to: point)
        }
    }
    context.closePath()
}

public func ellipse(context: CGContext, center: CGPoint, rx: CGFloat, ry: CGFloat) {
    let res = 4.0 / max(rx, ry)
    var first = true
    for t in stride(from: 0.0, to: Double.pi * 2.0, by: res) {
        let point = CGPoint(x: center.x + cos(t) * rx, y: center.y + sin(t) * ry)
        if first {
            first = false
            context.move(to: point)
        } else {
            context.addLine(to: point)
        }
    }
    context.closePath()
}
