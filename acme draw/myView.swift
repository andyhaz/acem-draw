//
//  myView.swift
//  acme design
//
//  Created by andrew hazlett on 12/17/20.
//
import Cocoa
import AppKit

class myView: NSView {

    // MARK: - Variables
    var viewData =  [NSObject]()
    var backgroundColor = NSColor()
    var myx = 0
    var myy = 0
    var myw = 1
    var myh = 1
    
    override func draw(_ dirtyRect: NSRect) {
        print("draw - VD",viewData)
        super.draw(dirtyRect)
        // Drawing code here.
        NSColor.yellow.setFill()
        backgroundColor.set()
        //
        __NSRectFill(dirtyRect)
        // new render draw
        
        //let vd = viewData[0] as? propertyData
        //print("vd",vd?.mouseLocY as Any,vd?.mouseLocX as Any)
        
        for obj in viewData{
            let vd = obj as? propertyData
            let x = Float(vd!.mouseLocX)
            let y = Float(vd!.mouseLocY)
            let w = Float(vd!.rectWidth)
            let h = Float(vd!.rectHeight)
            let s = Float(vd!.rectSize)
            let r = Float(vd!.rectRound)
            drawRect(locX:x, locY:y, locW:w, locH:h, size:s, round:r)
            print("viewsData",x,y,h,w,s,r)
        }
        // Draw rect
       // drawRect(locX:myx, locY:myy, locW:myw, locH:myh)
        //
    }//
    
    func drawRect(locX:Float, locY:Float, locW:Float, locH:Float, size:Float, round:Float) {
        let path = NSBezierPath()
//path.appendRect(NSRect(x:locX ,y:locY ,width:locW, height:locH))
        let myrect = NSRect(x:Int(locX), y: Int(locY), width: Int(locW), height: Int(locH))
        path.appendRoundedRect(myrect,xRadius:CGFloat(round) ,yRadius: CGFloat(round))
        NSColor.red.setFill()
        NSColor.black.setStroke()
        path.lineWidth = CGFloat(size)
        path.stroke()
        path.fill()
    }
    
//basic draw rec
/*    func drawRect(locX:Int, locY:Int, locW:Int, locH:Int) {
        let rect = NSRect(x:locX, y:locY, width:locW ,height:locH)
        NSColor.red.setFill()
        NSColor.black.setStroke()
        rect.fill()
    //  rect.stroke()
    }*/
    func updateDisplay() {
      //  print("update display")
        self.needsDisplay = true
    }
// MARK: - Method
    func changeBackgroundColor(color: NSColor) {
        backgroundColor = color
        setNeedsDisplay(self.bounds)
    }
}
