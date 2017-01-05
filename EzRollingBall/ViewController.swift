//
//  ViewController.swift
//  EzRollingBall
//
//  Created by iOS Student on 1/5/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var ball = UIImageView()
    var radians = CGFloat()
    var isTurnHorizontal:Bool = false
    var isTurnVertical:Bool = false

    var ballRadious =  CGFloat()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addBall()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
        
    }
    
    func addBall()
    {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadious = 32.0
        ball.center = CGPoint(x: ballRadious,y: mainViewSize.height*0.5)
        self.view.addSubview(ball)
    }
    func rollBall()
    {
        let deltaAngle: CGFloat = 0.1
        radians = radians + deltaAngle
        let bongngang:Int = Int(ball.center.x)
        let bongdoc:Int = Int(ball.center.y)
        let viewWith:Int = Int(view.bounds.size.width - 32)
        let viewHeight:Int = Int(view.bounds.size.height - 32)
        
        if !isTurnHorizontal{
            ball.transform = CGAffineTransform(rotationAngle: radians)
            ball.center = CGPoint(x: ball.center.x + ballRadious * deltaAngle, y: ball.center.y)
        }
        
        if !isTurnVertical{
            ball.transform = CGAffineTransform(rotationAngle: radians)
            ball.center = CGPoint(x: ball.center.x, y: ball.center.y + ballRadious * deltaAngle)
        }
        
        if bongngang >= viewWith{
            isTurnHorizontal = true
        }
        
        if bongdoc >= viewHeight{
            isTurnVertical = true
        }
        
        if isTurnHorizontal{
            ball.transform = CGAffineTransform(rotationAngle: -radians)
            ball.center = CGPoint(x: ball.center.x - ballRadious * deltaAngle, y: ball.center.y)
        
        }
        if isTurnVertical{
            ball.transform = CGAffineTransform(rotationAngle: -radians)
            ball.center = CGPoint(x: ball.center.x, y: ball.center.y  - ballRadious * deltaAngle)
            
        }

        
        if bongngang <= 32 {
            isTurnHorizontal = false
        }
        if bongdoc <= 32 {
            isTurnVertical = false
        }
        
    }
    
}



