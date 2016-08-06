//
//  SearchItem.swift
//  TableViewIndex
//
//  Created by Makarov Yury on 06/08/16.
//  Copyright © 2016 Makarov Yury. All rights reserved.
//

import UIKit

public class SearchItem : UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func sizeThatFits(size: CGSize) -> CGSize {
        return CGSize(width: size.width * 0.75, height: ceil(size.height * 1.15))
    }
    
    public override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let xMargin = max(rect.width - rect.height, 0) / 2
        let yMargin = max(rect.height - rect.width, 0) / 2
        
        let targetRect = rect.insetBy(dx: xMargin, dy: yMargin)
        
        let radius = targetRect.width / 3.1
        let lineWidth = targetRect.width / 6.0
        
        let circleFrame = CGRect(origin: CGPoint(x: targetRect.x + lineWidth / 2, y: targetRect.y + lineWidth / 2),
                                 size: CGSize(width: radius * 2, height: radius * 2))
        
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetStrokeColorWithColor(context, tintColor.CGColor)
        
        CGContextAddEllipseInRect(context, circleFrame)
        
        CGContextStrokePath(context)
        
        let handlePt1 = CGPoint(x: circleFrame.centerX + CGFloat(cos(315 * M_PI / 180)) * radius,
                                y: circleFrame.centerY + CGFloat(cos(315 * M_PI / 180)) * radius)
        let handlePt2 = CGPoint(x: targetRect.right - lineWidth / 3.0, y: targetRect.bottom - lineWidth / 3.0)
        
        CGContextMoveToPoint(context, handlePt1.x, handlePt1.y)
        CGContextAddLineToPoint(context, handlePt2.x, handlePt2.y)
        
        CGContextStrokePath(context)
    }
    
    public override func blocksEdgeTruncation() -> Bool {
        return true
    }
}
