import AppKit
import CoreGraphics

extension CGColor {
    public static let black = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
}

extension CGRect {
    public var center: CGPoint { CGPoint(x: self.midX, y: self.midY) }
}

public func draw(width: CGFloat, height: CGFloat, closure: @escaping (CGContext, CGRect) -> Void) -> NSImage {
    NSImage(size: NSSize(width: width, height: height), flipped: true) { rect in
        let graphicsContext = NSGraphicsContext.current!
        let context = graphicsContext.cgContext
        context.setStrokeColor(.black)

        closure(context, rect)
        return true
    }
}
