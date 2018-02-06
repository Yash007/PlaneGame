//
//  GameObject.swift
//  SimpleGame
//
//  Created by YASH SOMPURA on 2018-01-29.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameObject: SKSpriteNode, GameProtocol {
    //Instance Variables
    var dx : CGFloat?
    var dy : CGFloat?
    
    var width: CGFloat?
    var height: CGFloat?
    
    var scale: CGFloat?
    var isColliding: Bool?
    
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    //Constructors
    
    init(imageString: String, initialScale: CGFloat)    {
        //Initialize the object with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        self.scale = initialScale
        self.width = texture.size().width * self.scale!
        self.height = texture.size().height * self.scale!
        
        self.halfWidth = self.width! * 0.5
        self.halfHeight = self.height! * 0.5
        self.isColliding = false
        self.name = imageString
        
        randomSource = GKARC4RandomSource()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func Reset() {
        
    }
    
    public func CheckBounds()   {
        
    }
    
    public func Start() {
        
    }
    
    public func Update()    {
        
    }
    
    
}
