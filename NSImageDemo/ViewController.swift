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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
//    image_view = NSImageView(image: small_image)
//    image_view?.frame.origin = NSMakePoint((NSMidX(self.view.bounds) - NSMidX((image_view?.bounds)!)) / 2, (NSMidY(self.view.bounds)-NSMidY((image_view?.bounds)!))/2)
//    self.view.addSubview(image_view!)
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

