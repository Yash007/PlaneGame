//
//  Plane.swift
//  SimpleGame
//
//  Created by YASH SOMPURA on 2018-01-29.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit

class Plane: GameObject {
    
    //Initializers
    init()  {
        super.init(imageString: "plane", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds() {
        
        //right boundry
        if self.position.x > screenSize.width - self.halfWidth!  {
            self.position.x = screenSize.width - self.halfWidth!
        }
        
        //left boundry
        if self.position.x < self.halfWidth!    {
            self.position.x = self.halfWidth!
        }
    }
    
    override func Start() {
        
    }
    
    override func Update() {
        self.CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint) {
        self.position = newPos
    }
}
