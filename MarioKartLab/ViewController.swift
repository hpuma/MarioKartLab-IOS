//
//  ViewController.swift
//  MarioKartLab
//
//  Created by hpuma on 3/6/21.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    // References to character image views
    @IBOutlet weak var kartView0: UIImageView!
    @IBOutlet weak var kartView1: UIImageView!
    @IBOutlet weak var kartView2: UIImageView!
    @IBOutlet weak var kartView3: UIImageView!
    @IBOutlet weak var kartView4: UIImageView!
    
    // Initializing position variables to store starting positions for each character
    var startKart0 = CGPoint()
    var startKart1 = CGPoint()
    var startKart2 = CGPoint()
    var startKart3 = CGPoint()
    var startKart4 = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Storing the initial position of all the carts
        startKart0 = kartView0.center
        startKart1 = kartView1.center
        startKart2 = kartView2.center
        startKart3 = kartView3.center
        startKart4 = kartView4.center
    }
    
    // Move cart
    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        print("Location: x: \(location.x) , y: \(location.y)")
        let kartView = sender.view!
        kartView.center = location
    }
    
    // Pinch cart to change size
    @IBAction func didPinchKartView(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        print("Scale: \(scale)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    // Rotate cart
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        print("Rotation: \(rotation)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    // Double tab cart to run forward
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        print("Double tap recognized")
        let kartView = sender.view!
        
        UIView.animate(withDuration: 0.6) {
            kartView.center.x += 400
        }
    }
    
    // Press background to reset all cart positions
    @IBAction func didLongPress(_ sender: UILongPressGestureRecognizer) {
        print("Long press recognized")
        if sender.state == .began
            {
                let alertController = UIAlertController(title: nil, message:
                    "Long-Press Gesture Detected", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))

                present(alertController, animated: true, completion: nil)
            }
        UIView.animate(withDuration: 0.8) {
            self.kartView0.center = self.startKart0
            self.kartView1.center = self.startKart1
            self.kartView2.center = self.startKart2
            self.kartView3.center = self.startKart3
            self.kartView4.center = self.startKart4
        }
    }
}
