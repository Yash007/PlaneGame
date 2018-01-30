import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    //Game Variables
    var planeSprite: Plane?
    
    
    override func didMove(to view: SKView) {
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        //add Plane
        self.planeSprite = Plane()
        self.planeSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 50)
        self.addChild(planeSprite!)
        
        print(self.planeSprite?.halfWidth)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50))
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        self.planeSprite?.Update()
    }
}
