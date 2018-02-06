import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    //Game Variables
    var oceanSprite: Ocean?
    var planeSprite: Plane?
    var islandSprite: Island?
    var cloudSprites: [Cloud] = []
    
    
    override func didMove(to view: SKView) {
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        //add Ocean
        self.oceanSprite = Ocean()
        self.addChild(oceanSprite!)
        
        //add Island
        self.islandSprite = Island()
        self.addChild(islandSprite!)
        
        
        //add Plane
        self.planeSprite = Plane()
        self.planeSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 50)
        self.addChild(planeSprite!)
        
        //cloud
        for index in 0...2 {
            let cloud: Cloud = Cloud()
            cloudSprites.append(cloud)
            self.addChild(cloudSprites[index])
        }
        
        
        
        //play background engine sound
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        //preload sounds
        do {
            let sounds:[String] = ["thunder","yay"]
            for sound in sounds {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        }
        catch   {
            
        }
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
        self.oceanSprite?.Update()
        self.planeSprite?.Update()
        self.islandSprite?.Update()
        for cloud in cloudSprites   {
            cloud.Update()
        }
    }
}
