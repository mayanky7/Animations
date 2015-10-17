import UIKit
import QuartzCore
import XCPlayground

let viewFrame = CGRectMake(0, 0, 200, 200)

//Create a view
let view = UIView(frame: viewFrame)
XCPShowView("Some random view", view: view)

//Add a layer
let layer = CALayer()
layer.frame = CGRectMake(0, 0, 20, 20)
layer.contents = UIImage(named: "star")?.CGImage
let shrink = CABasicAnimation(keyPath: "transform.scale")
shrink.fromValue = 1
shrink.toValue = 0.5
shrink.autoreverses = true
shrink.duration = 1
shrink.repeatCount = Float.infinity
layer.addAnimation(shrink, forKey: "scale")

//Add a replicator layer
let replicator = CAReplicatorLayer()
let layerWidth = 2*CGRectGetWidth(layer.frame)
replicator.frame = CGRectInset(viewFrame, layerWidth, layerWidth)
replicator.instanceCount = 10
replicator.instanceDelay = (2*shrink.duration)/Double(replicator.instanceCount)
let angle = (2*M_PI)/Double(replicator.instanceCount)
replicator.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0, 0, 1)
replicator.addSublayer(layer)
view.layer.addSublayer(replicator)