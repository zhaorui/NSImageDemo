//
//  ViewController.swift
//  NSImageDemo
//
//  Created by 赵睿 on 20/03/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    // why var->let would cause compile err?
    var image_view : NSImageView?
    @IBOutlet weak var image_demo_view: ImageDemoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //image_view = NSImageView(image: small_image)
        //image_view?.frame.origin = NSMakePoint((NSMidX(self.view.bounds) - NSMidX((image_view?.bounds)!)) / 2, (NSMidY(self.view.bounds)-NSMidY((image_view?.bounds)!))/2)
        //self.view.addSubview(image_view!)
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

  @IBAction func switchCompositingOperation(_ sender: NSButton) {
    guard let id = sender.identifier else { return }
    guard let box_id = sender.superview?.superview?.identifier else {return}
    var operation : NSCompositingOperation = .clear
    switch id {
    case "clear":
        operation = .clear
        break
    case "copy":
        operation = .copy
        break
    case "sourceOver":
        operation = .sourceOver
        break
    case "sourceIn":
        operation = .sourceIn
        break
    case "sourceOut":
        operation = .sourceOut
        break
    case "sourceAtop":
        operation = .sourceAtop
        break
    case "destinationOver":
        operation = .destinationOver
        break
    case "destinationIn":
        operation = .destinationIn
        break
    case "destinationAtop":
        operation = .destinationAtop
        break
    case "XOR":
        operation = .XOR
        break
    case "plusDarker":
        operation = .plusDarker
        break
    case "plusLighter":
        operation = .plusLighter
        break
    default:
        break
    }
    
    if box_id == "top-left" {
        image_demo_view.top_left_operation = operation
    } else if box_id == "bottom-right" {
        image_demo_view.bottom_right_operation = operation
    } else {
        fatalError("unknown box_id")
    }
    
    image_demo_view.setNeedsDisplay(image_demo_view.bounds)
  }
}

