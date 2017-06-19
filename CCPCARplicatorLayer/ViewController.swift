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
        //animation_1()
//        animation_2()
       // animation_3()
        anitimation_4()
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
        lay.instanceTransform = CATransform3DMakeTranslation(10.0, 0, 0)
    }
    
    func animation_2() {
        let lay = CAReplicatorLayer();
        lay.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        lay.cornerRadius = 10
        lay.backgroundColor = UIColor(white: 0.0, alpha: 0.75).cgColor
        lay.position = view.center
        view.layer.addSublayer(lay)
        let dot = CALayer()
        dot.bounds = CGRect(x: 0, y: 0, width: 14, height: 14)
        dot.position = CGPoint(x:100,y:40)
        dot.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        dot.backgroundColor = UIColor.white.cgColor
        dot.borderWidth = 1.0
        dot.cornerRadius = 2.0
        lay.addSublayer(dot)
        let dot_no:Int = 15
        lay.instanceCount = dot_no
        let dot_angle = CGFloat(2*M_PI)/CGFloat(dot_no)
        lay.instanceTransform = CATransform3DMakeRotation(dot_angle, 0, 0, 1.0)
        let duration:CFTimeInterval = 1.5
        let scale_animation = CABasicAnimation(keyPath:"transform.scale")
        scale_animation.fromValue = 1.0
        scale_animation.toValue = 0.1
        scale_animation.duration = duration
        scale_animation.repeatCount = Float.infinity
        dot.add(scale_animation, forKey: nil)
        lay.instanceDelay = duration/Double(dot_no)
        dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01)
    }

    func animation_3() {
        let lay = CAReplicatorLayer()
        lay.bounds = view.bounds
        lay.backgroundColor = UIColor(white:0.0,alpha:0.75).cgColor
        lay.position = view.center
        lay.anchorPoint = CGPoint(x: 0.5, y: 0)
        view.layer.addSublayer(lay)
        let dot = CALayer()
        dot.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
        dot.backgroundColor = UIColor(white: 0.8, alpha: 0.1).cgColor
        dot.borderColor = UIColor.white.cgColor
        dot.borderWidth = 1.0
        dot.cornerRadius = 5.0
        dot.shouldRasterize = true
        dot.rasterizationScale = UIScreen.main.scale
        lay.addSublayer(dot)
        let move = CAKeyframeAnimation(keyPath:"position")
        move.path = animation_path()
        move.repeatCount = Float.infinity
        move.duration = 4.0
        dot.add(move, forKey: nil)
        lay.instanceCount = 20
        lay.instanceDelay = 0.1
    }
    
    func animation_path()->CGPath {
        let pth = UIBezierPath()
        pth.move(to: CGPoint(x: 31.5, y: 71.5))
        pth.addLine(to: CGPoint(x: 31.5, y: 23.5))
        pth.addCurve(to: CGPoint(x: 58.5, y: 38.5), controlPoint1: CGPoint(x: 31.5, y: 23.5), controlPoint2: CGPoint(x: 53.5, y: 45.5))
        pth.addLine(to: CGPoint(x: 43.5, y: 48.5))
        pth.addLine(to: CGPoint(x: 53.5, y: 66.5))
        pth.addLine(to: CGPoint(x: 62.5, y: 51.5))
        pth.addLine(to: CGPoint(x: 70.5, y: 66.5))
        pth.addLine(to: CGPoint(x: 86.5, y: 23.5))
        pth.addLine(to: CGPoint(x: 86.5, y: 78.5))
        pth.addLine(to: CGPoint(x: 31.5, y: 78.5))
        pth.addLine(to: CGPoint(x: 31.5, y: 71.5))
        pth.close()
        var t = CGAffineTransform(scaleX: 3.0,y: 3.0)
        return pth.cgPath.copy(using: &t)!
    }
    
    func anitimation_4() {
        let lay_static = CAReplicatorLayer()
        lay_static.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        lay_static.position = view.center
        lay_static.backgroundColor = UIColor(white: 0, alpha: 0.5).cgColor
        lay_static.cornerRadius = 10;
        view.layer.addSublayer(lay_static)
        let dot_static = CALayer()
        dot_static.bounds = CGRect(x: 0, y: 0, width: 10, height: 3)
        dot_static.cornerRadius = 1.5;
        dot_static.backgroundColor = UIColor(white: 1, alpha: 1.0).cgColor
        dot_static.position = CGPoint(x: 35, y: 50)
        lay_static.addSublayer(dot_static)
        lay_static.instanceCount = 12
        lay_static.instanceTransform = CATransform3DMakeRotation(CGFloat(M_PI * 2) / 12, 0, 0, 1)
        let animation_alpha = CABasicAnimation(keyPath: "opacity")
        animation_alpha.fromValue = 0.5
        animation_alpha.toValue = 1.0
        animation_alpha.duration = 1.0
        animation_alpha.repeatCount = Float.infinity
        dot_static.add(animation_alpha, forKey: "")
        lay_static.instanceDelay = 1.0 / 12

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

