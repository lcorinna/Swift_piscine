//
//  ViewController.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/19/22.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let generation = generationShape(frameSize: CGSize(width: 100, height: 100))
    
    var startSize: CGSize = CGSize(width: 100, height: 100)
    
    let gravity = UIGravityBehavior()
    
    let animation = UIDynamicAnimator()
    
    let collision = UICollisionBehavior()
    
    let elastic = UIDynamicItemBehavior()
    
    let motionManager = CMMotionManager()
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    @objc func getCenterForFinger(tap: UITapGestureRecognizer) {
        let newTap = tap.location(in: self.view)
        let fall = generation.randomShape(newTap)
        view.addSubview(fall)
        collision.addItem(fall)
        gravity.addItem(fall)
        elastic.addItem(fall)
        addPanGesture(shape: fall)
        addPinchGesture(shape: fall)
        addRotateGesture(shape: fall)
        
        if motionManager.isAccelerometerAvailable {
            setupMotionManager()
        }
    }
    
    private func updateAnimationBehavior() {
        let behaviors = (animation.behaviors as NSArray).copy() as! [UIDynamicBehavior]
        self.animation.removeAllBehaviors()
        for tmp in behaviors {
            self.animation.addBehavior(tmp)
        }
    }
    
    private func addPanGesture (shape: Shape) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGesture(pan:)))
        shape.addGestureRecognizer(pan)
    }
    
    @objc func panGesture(pan: UIPanGestureRecognizer) {
        guard let shape = pan.view else { return }
        switch pan.state {
        case .began:
            gravity.removeItem(shape)
        case .changed:
            shape.center = pan.location(in: self.view)
            animation.updateItem(usingCurrentState: shape)
        default:
            gravity.addItem(shape)
        }
    }
    
    private func addPinchGesture (shape: Shape) {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(pinch:)))
        shape.addGestureRecognizer(pinch)
    }
    
    @objc func pinchGesture (pinch: UIPinchGestureRecognizer) {
        guard let shape = pinch.view else { return }
        if pinch.state == .began {
            startSize = shape.layer.bounds.size
        }
        else if pinch.state == .changed {
            shape.layer.bounds.size = CGSize(width: pinch.scale * startSize.width, height: pinch.scale * startSize.height)
            animation.updateItem(usingCurrentState: shape)
            updateAnimationBehavior()
        }
    }
    
    private func addRotateGesture (shape: Shape) {
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateGesture(rotate:)))
        shape.addGestureRecognizer(rotate)
    }
    
    @objc func rotateGesture(rotate: UIRotationGestureRecognizer) {
        guard let shape = rotate.view else { return }
        if rotate.state == .changed {
            shape.transform = shape.transform.rotated(by: rotate.rotation)
            animation.updateItem(usingCurrentState: shape)
            updateAnimationBehavior()
            rotate.rotation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collision.addBoundary(withIdentifier: "borders" as NSCopying, for: UIBezierPath(rect: self.view.frame))
        let tap = UITapGestureRecognizer(target: self, action: #selector(getCenterForFinger(tap:)))
        view.addGestureRecognizer(tap)
        
        gravity.magnitude = 5
        elastic.elasticity = 0.7
        animation.addBehavior(elastic)
        animation.addBehavior(gravity)
        
        collision.translatesReferenceBoundsIntoBoundary = true
        animation.addBehavior(collision)
        
    }
    
    private func setupMotionManager() {
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard let deviceMotion = self.motionManager.deviceMotion else {
                return
            }
            self.gravity.gravityDirection = CGVector(
                dx: deviceMotion.gravity.x,
                dy: deviceMotion.gravity.y)
        }
    }
}
