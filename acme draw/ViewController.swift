//
//  ViewController.swift
//  acme design
//
//  Created by andrew hazlett on 12/14/20.
//

import Cocoa
import Foundation

class ViewController: NSViewController,  NSTableViewDelegate, NSTableViewDataSource   {

    @IBOutlet weak var tableView: NSTableView!

    
    @IBOutlet weak var myView: myView!
    @IBOutlet weak var sizeVaulOutlet: NSSlider!
    @IBOutlet weak var roundValOutlet: NSSlider!

    var layerTable = [String]()
    
    lazy var window: NSWindow = self.view.window!
    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    var location: NSPoint { window.mouseLocationOutsideOfEventStream }
    
 // var mouseToggle = false
    var acmeData =  [NSObject]()//setup memory
    var acmeSelect = NSObject.self
    var mouseCount = 0
    var aryTableSelect = 0
  //  var Locx = 0
  //  var Locy = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
      
    //   print("myView",myView.bounds.width)
      // ct.cssData()
      //  ct.css_rect()
      //  ct.convetCssStringToHtml()
        //print(ct)
    //setup some test draw code to use
    /*   for i in 1...5 {
            let pd = propertyData(mlx: 10,mly: 10,rw: 10,rh: 10)
            pd.mouseLocX = 300
            pd.mouseLocY = 100 * i
            acmeData.append(pd)
            //print("acmeData", pd.mouseLocY, pd.mouseLocX)
        }//end
*/
        
     //   print("acmeData", pd2.mouseLocY, pd2.mouseLocX)
        
      //  print("acmeData", acmeData)
        myView.changeBackgroundColor(color: NSColor.white)
        self.renderView()
    }
    
    func renderView() {
    /*for obj in acmeData{
            let vd = obj as? propertyData
         // print("acmeData", vd?.mouseLocY as Any, vd?.mouseLocX as Any)
        }*/
        myView.viewData = acmeData
        myView.display()
        self.tableView.reloadData()//
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        window.acceptsMouseMovedEvents = true
       // tableView.reloadData()
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }//

    override func mouseDown(with event: NSEvent) {
        let event_location = event.locationInWindow
        let mLocx = Float(event_location.x)
        let mLocy = Float(event_location.y)
     //   mouseEvent(locX: Float(mLocx), locY: Float(mLocy))
        
        mouseCount += 1
        switch mouseCount{
        case 1:
            let pd = propertyData(mlx:mLocx, mly:mLocy, rw:0, rh:0, rs: 0, rr: 0)
            acmeData.append(pd)
            
            let strNewLayer = String(format: "Layer %d", acmeData.count)//add text to layer with last part of the data count
            layerTable.append(strNewLayer)
        break
        case 2:
            print("case 2")
            self.renderView()
            mouseCount = 0
        break
        default: break
            
        }
        //pass to css
      //  ct.csr.cssLocx = Int(mLocx)
      //  ct.csr.cssLocy = Int(mLocy)

        self.renderView()
      //  print("myview",mLocx,mLocx)
    }
    
    override func mouseMoved(with event: NSEvent) {
        if (mouseCount == 1){
            let event_location = event.locationInWindow
            let h = Float(event_location.y)
            let w = Float(event_location.x)
            
            
            let lastAry = acmeData.count - 1
            let myBox = acmeData[lastAry]
            
            
            let pd = myBox as? propertyData
            let curentMouseX = Float(pd!.mouseLocX)
            let curentMouseY = Float(pd!.mouseLocY)
            pd?.rectHeight = h - curentMouseY
            pd?.rectWidth =  w - curentMouseX
            self.renderView()
          //  print("Mouse moved")
        }
    }//end
    
    override func mouseUp(with event: NSEvent) {
      //  print(acmeData)
    }
    
//table view events
    func numberOfRows(in tableView: NSTableView) -> Int {
        return layerTable.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let item = (layerTable)[row]
        

        let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "layerCell_id"), owner: self) as? CustomTableCell
        
        cell?.layerViewCell.stringValue = item
        
        return cell
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        updateTableSatus()
    }
    
    func updateTableSatus(){
        let itemsSelected = tableView.selectedRow
        aryTableSelect = itemsSelected
        //print(itemsSelected)
    }
    
//end tableview events
    
    @IBAction func boradrSlide(_ sender: Any) {
        let myBox = acmeData[aryTableSelect]
        let pd = myBox as? propertyData
        pd?.rectRound = roundValOutlet.floatValue
        self.renderView()
    }
    
    @IBAction func sizeSlide(_ sender: Any) {
        let myBox = acmeData[aryTableSelect]
        let pd = myBox as? propertyData
        pd?.rectSize = sizeVaulOutlet.floatValue
        self.renderView()
    }
    
    @IBAction func exportCssAction(_ sender: Any) {
    //    print("export css")
        let ct = cssTag(rw:Float(myView.bounds.width), rh:Float(myView.bounds.height))
        let newData = ct.convertToCSS(drawDataAry: acmeData)
        print(newData)
    }
}
