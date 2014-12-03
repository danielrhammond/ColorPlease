//
//  ColorPlease.swift
//  ColorPlease
//
//  Created by Daniel Hammond on 7/13/14.
//  Copyright (c) 2014 Daniel Hammond. All rights reserved.
//

import UIKit

let GOLDEN_RATIO_CONJUGATE:Float = 0.618033988749895

public class Please {
    public init() {
    }
    
    func randomFloat() -> Float {
        return Float(arc4random_uniform(100)) / 100.0;
    }
    
    public func createColor(golden:Bool = true, baseColor:UIColor?) -> UIColor {
        var h: CGFloat = 0, s: CGFloat=0, b: CGFloat=0, a: CGFloat=0
        if let color = baseColor {
            color.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
            return createColor(golden: golden, hue: Float(h), saturation: Float(s), brightness: Float(b), alpha: Float(a))
        } else {
            return createColor(golden: golden)
        }
    }
    
    public func createColor(golden:Bool = true, hue:Float? = nil, saturation:Float = 0.5, brightness:Float = 0.8, alpha:Float = 1.0) -> UIColor {
        var seed_hue = hue? != nil ? hue! : randomFloat()
        var h:Float = golden ? fmodf(seed_hue + GOLDEN_RATIO_CONJUGATE, 1.0) : seed_hue
        return UIColor(hue: CGFloat(h), saturation: CGFloat(saturation), brightness: CGFloat(brightness), alpha: CGFloat(alpha))
    }
    
    public func createColorScheme(golden:Bool = true, count:Int) -> [UIColor] {
        var colors = [UIColor]()
        var color: UIColor?
        do {
            color = createColor(golden:golden, baseColor:color)
            colors.append(color!)
        } while colors.count < count
        return colors
    }
}
