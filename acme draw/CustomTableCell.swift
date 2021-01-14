//
//  CustomTableCell.swift
//  tableView
//
//  Created by andrew hazlett on 1/9/21.
//

import Cocoa

class CustomTableCell: NSTableCellView {


    
    @IBOutlet weak var layerViewCell: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
