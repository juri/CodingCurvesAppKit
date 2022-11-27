//: [Previous](@previous)

import Cocoa

//: # But we have to start somewhere…

print("---- sin")
for i in stride(from: 0.0, to: 6.28, by: 0.1) {
    let value = sin(i)
    print(value)
}

//: # Bring on the Curves!

do {
    let image = draw(width: 800.0, height: 600.0) { context, rect in
        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        for x in stride(from: 0.0, to: rect.width, by: 1.0) {
            let y = rect.height / 2 + sin(x)
            context.addLine(to: CGPoint(x: x, y: y))
        }
        context.strokePath()
    }
}

//: # Amplitude

do {
    let image = draw(width: 800, height: 500) { context, rect in
        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        let amplitude = rect.height * 0.45
        for x in stride(from: 0, to: rect.width, by: 1.0) {
            let y = rect.height / 2 + sin(x) * amplitude
            context.addLine(to: CGPoint(x: x, y: y))
        }
        context.strokePath()
    }
}

//: # Frequency

do {
    let image = draw(width: 800, height: 500) { context, rect in
        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        let amplitude = rect.height * 0.45
        let freq = 1.0
        for x in stride(from: 0, to: rect.width, by: 1.0) {
            let y = rect.height / 2 + sin(x / rect.width * Double.pi * 2 * freq) * amplitude
            context.addLine(to: CGPoint(x: x, y: y))
        }
        context.strokePath()
    }

    let imageFlipped = draw(width: 800, height: 500) { context, rect in
        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        let amplitude = rect.height * 0.45
        let freq = 1.0
        for x in stride(from: 0, to: rect.width, by: 1.0) {
            let y = rect.height / 2 + sin(x / rect.width * Double.pi * 2 * freq) * amplitude
            context.addLine(to: CGPoint(x: x, y: rect.height - y))
        }
        context.strokePath()
    }

    let imageFlipped_50_5 = draw(width: 800, height: 500) { context, rect in
        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        let amplitude = 50.0
        let freq = 5.0
        for x in stride(from: 0, to: rect.width, by: 1.0) {
            let y = rect.height / 2 + sin(x / rect.width * Double.pi * 2 * freq) * amplitude
            context.addLine(to: CGPoint(x: x, y: rect.height - y))
        }
        context.strokePath()
    }
}

//: # Wavelength

do {
    let image = draw(width: 800, height: 500) { context, rect in
        let amplitude = rect.height * 0.45
        let wavelength = 100.0

        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        for x in stride(from: 0, to: rect.width, by: 1.0) {
            let y = rect.height / 2 + sin(x / wavelength * Double.pi * 2) * amplitude
            context.addLine(to: CGPoint(x: x, y: y))
        }
        context.strokePath()
    }
}

//: # Resolution

do {
    let image_10 = draw(width: 800, height: 500) { context, rect in
        let amplitude = rect.height * 0.45
        let freq = 3.0
        let res = 10.0

        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        for x in stride(from: 0, to: rect.width, by: res) {
            let y = rect.height / 2 + sin(x / rect.width * Double.pi * 2 * freq) * amplitude
            context.addLine(to: CGPoint(x: x, y: y))
        }
        context.strokePath()
    }

    let image_20 = draw(width: 800, height: 500) { context, rect in
        let amplitude = rect.height * 0.45
        let freq = 3.0
        let res = 20.0

        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        for x in stride(from: 0, to: rect.width, by: res) {
            let y = rect.height / 2 + sin(x / rect.width * Double.pi * 2 * freq) * amplitude
            context.addLine(to: CGPoint(x: x, y: y))
        }
        context.strokePath()
    }
}

//: # Cosine

do {
    let image = draw(width: 800, height: 500) { context, rect in
        let amplitude = rect.height * 0.45
        let freq = 1.0

        var firstRun = true
        for x in stride(from: 0, to: rect.width, by: 1.0) {
            let y = rect.height / 2 + cos(x / rect.width * Double.pi * 2 * freq) * amplitude
            let point = CGPoint(x: x, y: rect.height - y)
            if firstRun {
                firstRun = false
                context.move(to: point)
            } else {
                context.addLine(to: point)
            }
        }
        context.strokePath()
    }
}

//: # A Function

do {
    let image = draw(width: 800, height: 500) { context, rect in
        sinewave(context: context, p0: .init(x: 100, y: 100), p1: CGPoint(x: 700, y: 400), freq: 10, amp: 40)
    }
}

//: # Tangent

print("---- tan")
for i in stride(from: 0.0, to: 6.28, by: 0.1) {
    let value = tan(i)
    print(value)
}

do {
    let image = draw(width: 800, height: 500) { context, rect in
        let amplitude = 10.0
        let freq = 1.0
        var first = true
        for x in stride(from: 0, to: rect.width, by: 1.0) {
            let y = rect.height / 2 + tan(x / rect.width * Double.pi * 2 * freq) * amplitude
            let point = CGPoint(x: x, y: rect.height - y)
            if first {
                context.move(to: point)
                first = false
            } else {
                context.addLine(to: point)
            }
        }
        context.strokePath()
    }
}

//: [Next](@next)
