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
    
    // via http://www.easyrgb.com/index.php?X=MATH&H=02#text2
    func RGBtoXYZ(red: Float, green: Float, blue: Float) -> (x: Float, y: Float, z: Float) {
        var r = red
        if red > 0.04045 {
            r = pow(( ( r + 0.055 ) / 1.055 ), 2.4)
        } else {
            r = r / 12.92
        }
        var g = green
        if g > 0.04045 {
            g = pow(( ( g + 0.055 ) / 1.055 ), 2.4)
        } else {
            g = g / 12.92
        }
        
        var b = blue
        if b > 0.04045 {
            b = pow(( ( b + 0.055 ) / 1.055 ), 2.4)
        } else {
            b = b / 12.92
        }
        
        r *= 100
        g *= 100
        b *= 100
        
        let x = r * 0.4124 + g * 0.3576 + b * 0.1805
        let y = r * 0.2126 + g * 0.7152 + b * 0.07222
        let z = r * 0.0193 + g * 0.1192 + b * 0.8505
        
        return (x,y,z)
    }
    
    func XYZtoCIELAB(x: Float, y: Float, z: Float) {
    }
}
