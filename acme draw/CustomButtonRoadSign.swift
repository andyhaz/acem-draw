//
//  CustomButtonRoadSign.swift
//  acme design
//
//  Created by andrew hazlett on 12/15/20.
//

import Cocoa

//@IBDesignable
class CustomButtonRoadSign: NSButton {
//    @IBInspectable var borderColor: NSColor = .black
//    @IBInspectable var normal: Bool = true
     
    var borderLineWidth: CGFloat {
        return min(bounds.width, bounds.height) * 0.05
    }
    
    var insetRect: CGRect {
        return bounds.insetBy(
            dx: borderLineWidth * 0.5,
            dy: borderLineWidth * 0.5)
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor.yellow.setFill()
        __NSRectFill(dirtyRect)
        
        let path = NSBezierPath(rect: insetRect)
        NSColor.red.setFill()
        path.fill()
    }
    
}
