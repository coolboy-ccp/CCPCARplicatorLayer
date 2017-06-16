//
//  ViewController.swift
//  CCPCARplicatorLayer
//
//  Created by Ceair on 17/6/16.
//  Copyright © 2017年 ccp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        animation_1()
    }
    
    func animation_1() {
        let lay = CAReplicatorLayer()
        lay.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        lay.position = view.center
        lay.backgroundColor = UIColor.clear.cgColor
        view.layer.addSublayer(lay)
        let bar = CALayer()
        bar.bounds = CGRect(x: 0, y: 0, width: 8.0, height: 40.0)
        bar.position = CGPoint(x: 10, y: 75)
        bar.cornerRadius = 2.0
        bar.backgroundColor = UIColor.red.cgColor
        lay.addSublayer(bar)
        let move = CABasicAnimation(keyPath: "position.y")
        move.toValue = bar.position.y - 35.0
        move.duration = 0.5
        move.autoreverses = true
        move.repeatCount = Float.infinity
        bar.add(move, forKey: nil)
        lay.instanceCount = 3
        lay.instanceDelay = 0.33
        lay.masksToBounds = true
        lay.instanceTransform = CATransform3DMakeTranslation(20.0, 0, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

