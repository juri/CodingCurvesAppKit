//: [Previous](@previous)

import Cocoa
import CodingCurves_Sources

//: # Circles

do {
    let image = draw(width: 600, height: 600) { context, rect in
        let c = rect.center
        let radius = 250.0
        var first = true
        for t in stride(from: 0, to: Double.pi * 2, by: 0.01) {
            let point = CGPoint(x: c.x + cos(t) * radius, y: c.y + sin(t) * radius)
            if first {
                first = false
                context.move(to: point)
            } else {
                context.addLine(to: point)
            }
        }
        context.closePath()
        context.strokePath()
    }

    let image_002 = draw(width: 600, height: 600) { context, rect in
        let c = rect.center
        let radius = 250.0
        var first = true
        for t in stride(from: 0, to: Double.pi * 2, by: 0.02) {
            let point = CGPoint(x: c.x + cos(t) * radius, y: c.y + sin(t) * radius)
            if first {
                first = false
                context.move(to: point)
            } else {
                context.addLine(to: point)
            }
        }
        context.closePath()
        context.strokePath()
    }
}

//: ## A Function

// The function is in [Helpers](Helpers.swift)

do {
    let image = draw(width: 600, height: 600) { context, rect in
        _circle(context: context, center: rect.center, radius: 200.0)
        context.strokePath()
    }
}

//: # Arcs

do {
    let image1 = draw(width: 600, height: 600) { context, rect in
        arc(context: context, center: rect.center, radius: 250, start: 0.5, end: 3.5)
        context.strokePath()
    }

    let image2 = draw(width: 600, height: 600) { context, rect in
        arc(context: context, center: rect.center, radius: 250, start: 3.5, end: 0.5)
        context.strokePath()
    }

    let image3 = draw(width: 600, height: 600) { context, rect in
        arc(context: context, center: rect.center, radius: 250, start: 3.5, end: 0.5, anticlockwise: false)
        context.strokePath()
    }

    let image4 = draw(width: 600, height: 600) { context, rect in
        arc(context: context, center: rect.center, radius: 250, start: 3.5, end: 0.5, anticlockwise: true)
        context.strokePath()
    }

    let circleImage = draw(width: 600, height: 600) { context, rect in
        circle(context: context, center: rect.center, radius: 250)
        context.strokePath()
    }
}

//: ## Segments and Sectors

do {
    let seg = draw(width: 600, height: 600) { context, rect in
        segment(context: context, center: rect.center, radius: 250, start: 2.5, end: 4.5, anticlockwise: false)
        context.strokePath()
    }

    let sec = draw(width: 600, height: 600) { context, rect in
        sector(context: context, center: rect.center, radius: 250, start: 2.5, end: 4.5, anticlockwise: false)
        context.strokePath()
    }
}

//: # Polygons

do {
    let poly1 = draw(width: 600, height: 600) { context, rect in
        polygon(context: context, center: rect.center, radius: 250, sides: 5)
        context.strokePath()
    }

    let poly2 = draw(width: 600, height: 600) { context, rect in
        polygon(context: context, center: rect.center, radius: 250, sides: 5, rotation: 0.5)
        context.strokePath()
    }

    let poly3 = draw(width: 600, height: 600) { context, rect in
        var angle = 0.0
        for r in stride(from: 5.0, through: 255.0, by: 10.0) {
            polygon(context: context, center: rect.center, radius: r, sides: 5, rotation: angle)
            context.strokePath()
            angle += 0.05
        }
        context.strokePath()
    }
}

//: # Ellipses

do {
    let ell = draw(width: 600, height: 600) { context, rect in
        ellipse(context: context, center: rect.center, rx: 250, ry: 150)
        context.strokePath()
    }
}

//: # Bonus

do {
    let image = draw(width: 600, height: 600) { context, rect in
        let res = Double.pi * 2.0 / 20.0 // to draw 20 circles
        for t in stride(from: 0.0, to: Double.pi * 2.0, by: res) {
            let x = rect.center.x + cos(t) * 200
            let y = rect.center.y + sin(t) * 200
            circle(context: context, center: CGPoint(x: x, y: y), radius: 20)
            context.strokePath()
        }
    }
}

//: [Next](@next)
