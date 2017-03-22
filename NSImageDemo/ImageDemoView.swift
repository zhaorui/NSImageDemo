//
//  ImageDemoView.swift
//  NSImageDemo
//
//  Created by 赵睿 on 20/03/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class ImageDemoView: NSView {

    static let image_square_edge : CGFloat = 100.0
    static let intersect_square_edge :CGFloat = image_square_edge / 2.0
    var top_left_operation : NSCompositingOperation = .clear
    var bottom_right_operation : NSCompositingOperation = .clear
    
    var top_left_image_origin : NSPoint {
        get {
            return NSMakePoint(NSMidX(self.bounds)-ImageDemoView.image_square_edge+ImageDemoView.intersect_square_edge/2,
                               NSMidY(self.bounds)-ImageDemoView.intersect_square_edge/2)
        }
    }
    
    var bottom_right_image_origin : NSPoint {
        get {
            return NSPoint(x: NSMidX(self.bounds)-ImageDemoView.intersect_square_edge/2,
                           y: NSMidY(self.bounds)-ImageDemoView.image_square_edge+ImageDemoView.intersect_square_edge/2)
        }
    }
    
    
    let swift_raw_image = NSImage(named: "swift-og")
    let cpp_raw_image = NSImage(named: "cpp-ca")

    lazy var cpp_medium_image : NSImage = {
    return NSImage( size: NSSize(width:image_square_edge,height:image_square_edge),
                    flipped: true,
                    drawingHandler: { rect in
                      self.cpp_raw_image?.draw(in: rect)
                      return true
                    })
    }()

    lazy var swift_medium_image : NSImage = {
    return NSImage(size: NSSize(width:image_square_edge,height:image_square_edge),
                   flipped: true,
                   drawingHandler: { rect in
                      self.swift_raw_image?.draw(in: rect)
                      return true
                   })
    }()
    
    lazy var swift_medium_circle_image : NSImage = {
        return NSImage(size: NSSize(width: image_square_edge, height: image_square_edge),
                       flipped: false,
                       drawingHandler: {rect in
                        NSGraphicsContext.saveGraphicsState()
                        let clip_path = NSBezierPath()
                        clip_path.appendArc(withCenter: NSMakePoint(image_square_edge / 2.0, image_square_edge / 2.0),
                                            radius: image_square_edge / 2.0 ,
                                            startAngle: 0.0,
                                            endAngle: 2.0*CGFloat(M_PI),
                                            clockwise: true)
                        clip_path.setClip()
                        self.swift_medium_image.draw(at: NSZeroPoint, from: NSZeroRect, operation: .sourceOver, fraction: 1.0)
                        NSGraphicsContext.restoreGraphicsState()
                        return true
                        })
    }()
  
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        NSColor.green.set()
        NSBezierPath(rect: dirtyRect).fill()
        swift_medium_circle_image.draw(at: top_left_image_origin, from: NSZeroRect, operation: top_left_operation, fraction: 1.0)
        cpp_medium_image.draw(at: bottom_right_image_origin, from: NSZeroRect, operation: bottom_right_operation, fraction: 1.0)
    }
    
}
