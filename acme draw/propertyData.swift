//
//  propertyData.swift
//  acme design
//
//  Created by andrew hazlett on 12/31/20.
//
import Cocoa

class propertyData: NSObject {
    var mouseLocX: Float
    var mouseLocY: Float
    var rectWidth: Float
    var rectHeight: Float
    var rectSize: Float
    var rectRound: Float
   //var rectBGColor =
    
    init(mlx: Float, mly: Float, rw: Float, rh: Float, rs:Float, rr:Float) {
        self.mouseLocY = mly
        self.mouseLocX = mlx
        self.rectWidth = rw
        self.rectHeight = rh
        self.rectSize = rs
        self.rectRound = rr
        super.init()
    }
}
