//
//  cssTag.swift
//  acme draw
//
//  Created by andrew hazlett on 1/9/21.
//

import Cocoa

struct cssSetupRec {
    var cssLocx = 0
    var cssLocy = 0
    var csslocz = -1
    var cssHeight = 100
    var cssWidth = 100
    var cssBoard = 2
    var cssRadius = 5
}

class cssTag: NSObject {
    var csr = cssSetupRec()
    var cssLayerStr = [String]()
    var cssStyle = ""

    func css_rect() {
        
        let countStr = cssLayerStr.count+1
        
        cssStyle = String(format: "#layer%d { position: absolute;left:%d px;top:%d px;height:%d px;width:%d px;border: %dpx solid red;border-radius: %dpx; background-color: powderblue;z-index:%d;}",countStr,csr.cssLocx, csr.cssLocy, csr.cssHeight, csr.cssWidth,csr.cssBoard,csr.cssRadius, csr.csslocz )
        
        
        cssLayerStr += [cssStyle]
        
        print(cssLayerStr)
    }
    
    func convetCssStringToHtml() {
        let html:String = String(format:"""
        <!DOCTYPE html>
        <html>
        <head>
           <title> </title>
           <style type="text/css" media="screen">
            %@
           </style>
        </head>
        <body>
           <div id="layer1">Content here</div>
        </body>
        </html>
        """,cssStyle)
        print("html:",html)
    }
    
    
    func cssData() {
        let html:String = """
        <!DOCTYPE html>
        <html>
        <head>
           <title> </title>
           <style type="text/css" media="screen">
               #layer1 {
                     position: absolute;
                       left: 0px;
                       top: 0px;
                       height: 200px;
                       width: 50%;
                        border: 2px solid red;
                        border-radius: 5px;
                       background-color: powderblue;
                       z-index: -1;
               }
               
           </style>
        </head>
        <body>
           <div id="layer1">Content here</div>
        </body>
        </html>
        """
        print("html:",html)
    }
}//end