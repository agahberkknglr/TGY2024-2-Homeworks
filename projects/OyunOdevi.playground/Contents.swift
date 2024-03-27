/*
 @author: Agah Berkin Guler
 */

import Foundation


class Game {
    private var player: Player?
    private var cannon: Cannon
    private var wall: Wall?
    
    init() {
        self.cannon = Cannon()
    }
    
    func setPlayerData(nickname: String) {
        player = Player(nickname: nickname)
    }
    
    func setWallDistance(distance: Double, delta: Double) {
        if distance >= 0 && distance <= 1500 && delta >= 0.1 && delta <= 1 {
            wall = Wall(distance: distance, delta: delta)
        } else {
            print("Error!! Invalid Wall")
        }
    }
    
    func setCannonParams(angle: Double, velocity: Double) {
        cannon.setAngle(angle)
        cannon.setVelocity(velocity)
    }
    
    func launchCannon() {
        guard let player = player else { print("Error! Player is not setted!!"); return}
        guard let wall = wall else { print("Error! Wall is not setted!!"); return}
        
        let range = cannon.calculateRange()
        if wall.checkState(range: range) {
            player.increasePoint()
            print("Wall destroyed!! Congratz!")
        } else {
            print("Failed!! Cannon missed the Wall!")
        }
        player.displayPoint()
    }
}

class Player {
    private var nickname: String
    private var points: Int
    
    init(nickname: String) {
        self.nickname = nickname
        self.points = 0
    }
    
    func displayPoint() {
        print("\(nickname)'s Score: \(points)")
    }
    
    func increasePoint() {
        points += 1
    }
}

class Cannon {
    
    private var angle: Double
    private var velocity: Double
     
    init() {
        self.angle = 0
        self.velocity = 0
    }
    
    func setAngle(_ angle: Double){
        if angle >= 0 && angle <= 90 {
            self.angle = angle
        } else {
            print("Error!! Invalid angle!!")
        }
    }
    
    func setVelocity(_ velocity: Double) {
        if velocity >= 0 && velocity <= 100 {
            self.velocity = velocity
        } else {
            print("Error!! Invalid velocity!!")
        }
    }
    
    func calculateRange() -> Double {
        let g = 10.0
        return (velocity * velocity * sin(2 * Double.pi * angle / 180)) / g
    }
    
}

class Wall {
    
    private var distance: Double
    private var delta: Double
    private var state: Bool
    
    init(distance: Double, delta: Double, state: Bool = true) {
        self.distance = distance
        self.delta = delta
        self.state = state
    }
    
    func checkState(range: Double) -> Bool {
        let lowerBound = distance - delta
        let upperBound = distance + delta
        if range >= lowerBound && range <= upperBound {
            state = false //destroyed
            return true
        } else {
            state = true //didnt hit
            return false
        }
    }
    
}


// start game

let game1 = Game()
game1.setPlayerData(nickname: "Player1")
game1.setWallDistance(distance: 1000, delta: 1)
game1.setCannonParams(angle: 45, velocity: 100)
game1.launchCannon()
game1.setWallDistance(distance: 500, delta: 1)
game1.setCannonParams(angle: 15, velocity: 10)
game1.launchCannon()
game1.setCannonParams(angle: 15, velocity: 100)
game1.launchCannon()
//game1.setWallDistance(distance: 1600, delta: 2)
//game1.setCannonParams(angle: 45, velocity: 1000)
//game1.launchCannon()



