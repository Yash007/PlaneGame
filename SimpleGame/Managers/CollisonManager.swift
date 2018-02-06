import CoreGraphics
import SpriteKit

class CollisonManager {
    init() {
        
    }
    
    public static func CheckCollision(scene: SKScene, object1: GameObject, object2: GameObject) {
        if(CGPoint.Distance(P1: object1.position, P2: object2.position) < object1.halfHeight! + object2.halfHeight!)  {
            if (!object2.isColliding!)  {
                if(object2.name == "island")    {
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                }
                
                if(object2.name == "cloud") {
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                }
                
                object2.isColliding = true
            }
            
        }
        else {
            object2.isColliding = false
        }
    }
}
