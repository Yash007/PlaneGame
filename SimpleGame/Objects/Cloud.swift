//
//  Cloud.swift
//  SimpleGame
//
//  Created by YASH SOMPURA on 2018-02-05.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit
import GameplayKit

class Cloud: GameObject {
    init()  {
        //initialize the object with an Image
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func Start() {
        
        self.setScale(0.6)
        
        self.width = (texture?.size().width)! * self.scale!
        self.height = (texture?.size().height)! * self.scale!
        
        self.halfWidth = self.width! * 0.5
        self.halfHeight = self.height! * 0.5
        self.zPosition = 3
        self.Reset()
        self.dy = 7.0
    }
    
    override func Reset()    {
        self.position.y = 700 + self.height!
        let randomX: Int = (randomSource?.nextInt(upperBound: Int(screenWidth! - self.width!)))! + Int(self.halfWidth!)
        self.position.x = CGFloat(randomX)
        self.dy = CGFloat(((randomSource?.nextUniform())! * 5.0 + 5.0))
        self.dx = CGFloat(((randomSource?.nextUniform())! * -4.0 + 2.0))
    }
    
    override func CheckBounds() {
        if (self.position.y < (0 - self.height!))    {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.position.x -= self.dx!
        self.CheckBounds()
    }
}
