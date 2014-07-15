//
//  ColorPlease.swift
//  ColorPlease
//
//  Created by Daniel Hammond on 7/13/14.
//  Copyright (c) 2014 Daniel Hammond. All rights reserved.
//

import UIKit

let GOLDEN_RATIO_CONJUGATE:Float = 0.618033988749895

class ColorPlease {
    func randomFloat() -> Float {
        return Float(arc4random_uniform(100)) / 100.0;
    }
    
    func createColor(golden:Bool = true, baseColor:UIColor?) -> UIColor {
        var h: CGFloat = 0, s: CGFloat=0, b: CGFloat=0, a: CGFloat=0
        if let color = baseColor {
            color.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
            return createColor(golden: golden, hue: h, saturation: s, brightness: b, alpha: a)
        } else {
            return createColor(golden: golden)
        }
    }
    
    func createColor(golden:Bool = true, hue:Float? = nil, saturation:Float = 0.5, brightness:Float = 0.8, alpha:Float = 1.0) -> UIColor {
        var seed_hue = hue ? hue! : randomFloat()
        var h = golden ? fmodf(seed_hue + GOLDEN_RATIO_CONJUGATE, 1.0) : seed_hue
        return UIColor(hue: h, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    func createColorScheme(golden:Bool = true, count:Int) -> [UIColor] {
        var colors = [UIColor]()
        var color: UIColor?
        do {
            color = createColor(golden:golden, baseColor:color)
            colors.append(color!)
        } while colors.count < count
        return colors
    }
}
