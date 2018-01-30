
import SpriteKit

class Ocean: GameObject {
    // contructor
    
    init()  {
        //initialize the object with an Image
        super.init(imageString: "ocean", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.anchorPoint = CGPoint.zero
        self.dy = 5.0
    }
    
    override func Reset()    {
        self.position = CGPoint.zero
        
    }
    
    override func CheckBounds() {
        if self.position.y < -775   {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
}

