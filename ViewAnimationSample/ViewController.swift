//
//  ViewController.swift
//  ViewAnimationSample
//
//  Created by WENDRA RIANTO on 2021/12/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func clickScaleUpButton(_ sender: UIButton) {
        let animationGroup = CAAnimationGroup()
        
        animationGroup.duration = 2.0
        
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        
        animationGroup.isRemovedOnCompletion = false
        
        let animation1 = CABasicAnimation(keyPath: "transform.scale")
        
        animation1.fromValue = 1.0
        animation1.toValue = 3.0
        
        animationGroup.animations = [animation1]
        
        imgView.layer.add(animationGroup, forKey:nil)
    }
    
    @IBAction func clickScaleDownButton(_ sender: UIButton) {
        let animationGroup = CAAnimationGroup()
        
        animationGroup.duration = 1.0
        
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        
        animationGroup.isRemovedOnCompletion = false
        
        let animation1 = CABasicAnimation(keyPath: "transform.scale")
        
        animation1.fromValue = 1.0
        animation1.toValue = 0.25
        
        animationGroup.animations = [animation1]
        
        imgView.layer.add(animationGroup, forKey:nil)
    }
    
    @IBAction func clickRotateButton(_ sender: UIButton) {
        let animationGroup = CAAnimationGroup()
        
        animationGroup.duration = 1.0
        
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        
        animationGroup.isRemovedOnCompletion = false
        
        let animation2 = CABasicAnimation(keyPath: "transform.rotation")
        
        animation2.fromValue = 0.0
        animation2.toValue = Double.pi * 2.0
        animation2.speed = 1.0
        
        animationGroup.animations = [animation2]
        
        imgView.layer.add(animationGroup, forKey:nil)
    }
    
    @IBAction func clickScaleUpAndRotateButton(_ sender: UIButton) {
        let animationGroup = CAAnimationGroup()
        
        animationGroup.duration = 1.0
        
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        
        animationGroup.isRemovedOnCompletion = false
        
        let animation1 = CABasicAnimation(keyPath: "transform.scale")
        
        animation1.fromValue = 1.0
        animation1.toValue = 3.0
        
        let animation2 = CABasicAnimation(keyPath: "transform.rotation")
        
        animation2.fromValue = 0.0
        animation2.toValue = Double.pi * 2.0
        animation2.speed = 2.0
        
        animationGroup.animations = [animation1,animation2]
        
        imgView.layer.add(animationGroup, forKey:nil)
    }
    
    @IBAction func clickBasicAnimation(_ sender: UIButton) {
        UIView.animate(
            withDuration : 0.5,
            delay : 0.0,
            options : UIView.AnimationOptions.curveEaseInOut,
            animations : { () -> Void in
                
                self.imgView.center = CGPoint(
                    x: self.imgView.center.x,
                    y: self.imgView.center.y + 100)
            }, completion : nil)
    }
    @IBAction func clickLinearAnimation(_ sender: UIButton) {
        UIView.animate(
            withDuration : 0.5,
            delay : 0.0,
            options : UIView.AnimationOptions.curveLinear,
            animations : { () -> Void in
                
                self.imgView.center = CGPoint(
                    x: self.imgView.center.x,
                    y: self.imgView.center.y + 100)
            }, completion : nil)
    }
    @IBAction func clickSpringAnimation(_ sender: UIButton) {
        UIView.animate(
            withDuration : 0.5,
            delay : 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.0,
            options : UIView.AnimationOptions.curveEaseInOut,
            animations : { () -> Void in
                
                self.imgView.center = CGPoint(
                    x: self.imgView.center.x,
                    y: self.imgView.center.y + 100)
            }, completion : nil)
    }
    @IBAction func clickLoopAnimation(_ sender: UIButton) {
        UIView.animate(
            withDuration : 0.5,
            delay : 0.0,
            options : [UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse],
            animations : { () -> Void in
                
                self.imgView.center = CGPoint(
                    x: self.imgView.center.x,
                    y: self.imgView.center.y + 100)
            }, completion : nil)
    }
    @IBAction func clickResetPosition(_ sender: UIButton) {
        UIView.animate(
            withDuration : 0.5,
            delay : 0.0,
            options : UIView.AnimationOptions.curveEaseInOut,
            animations : { () -> Void in
                
                self.imgView.center = CGPoint(
                    x: 150,
                    y: 150)
            }, completion : nil)
    }
    @IBAction func clickRotateCircle(_ sender: UIButton) {
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = view.bounds
        
        view.layer.addSublayer(replicatorLayer)
        
        let circle = CALayer()
//        let circle = imgView
        circle.bounds = CGRect(x: 0, y:0, width: 10, height: 10)
        circle.position = view.center
        circle.position.x -= 30

        circle.backgroundColor = UIColor.black.cgColor
        circle.cornerRadius = 5
        replicatorLayer.addSublayer(circle)
        
        replicatorLayer.instanceCount = 6
        replicatorLayer.instanceDelay = 0.1
        
        let angle = (2.0+Double.pi)/Double(replicatorLayer.instanceCount)
        
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle),0.0,0.0,1.0)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 0.0
        scaleAnimation.duration = 0.5
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        circle.add(scaleAnimation, forKey: "scaleAnimation")
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotationAnimation.toValue = -2.0+Double.pi
        rotationAnimation.duration = 6.0
        rotationAnimation.repeatCount = .infinity
        
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        replicatorLayer.add(rotationAnimation, forKey: "rotationAnimation")
    }
}

