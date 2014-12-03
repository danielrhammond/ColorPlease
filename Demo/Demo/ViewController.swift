//
//  ViewController.swift
//  Demo
//
//  Created by Daniel Hammond on 7/13/14.
//  Copyright (c) 2014 Daniel Hammond. All rights reserved.
//

import UIKit
import ColorPlease

class ViewController: UIViewController {

    let colorGenerator = ColorPlease.Please()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: "tapAction")
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tapAction() {
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        let colors = colorGenerator.createColorScheme(count:6)
        
        var swatchHeight:Float = Float(self.view.bounds.size.height)
        swatchHeight = Float(swatchHeight) / Float(colors.count)
        for (i, color) in enumerate(colors) {
            let swatch = UIView()
            swatch.backgroundColor = color
            let yOrigin:Float = swatchHeight * Float(i)
            swatch.frame = CGRectMake(CGRectGetMinX(self.view.bounds), CGFloat(yOrigin), CGRectGetWidth(self.view.bounds), CGFloat(swatchHeight))
            self.view.addSubview(swatch)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

