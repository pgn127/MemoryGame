//
//  GameModel.swift
//  
//
//  Created by Pamela Needle on 8/14/15.
//
//

import Foundation
import UIKit

//code from http://ijoshsmith.com/2014/06/17/randomly-shuffle-a-swift-array/
//extension Array
//{
//    /** Randomizes the order of an array's elements. */
//    mutating func shuffle()
//    {
//        for _ in 0..<10
//        {
//            sort { (_,_) in arc4random() < arc4random() }
//        }
//    }
//}
//extension Array {
//    mutating func shuffle() {
//        if count < 2 { return }
//        for i in 0..<(count - 1) {
//            let j = Int(arc4random_uniform(UInt32(count - i))) + i
//            swap(&self[i], &self[j])
//        }
//    }
//}

protocol GameModelDelegate {
    func gameDidComplete(gameModel: GameModel)
    func didMatchTile(gameModel: GameModel,tileIndex: Int,previousTileIndex:Int)
    func didFailToMatchTile(gameModel: GameModel, tileIndex: Int, previousTileIndex: Int)
    func scoreDidUpdate(gameModel: GameModel,newScore: Int)
}



class GameModel {
    
    //gamemodel properties
    var lastTileIndex: Int?
    var secondLastTileIndex: Int?
    var gameState : [TileData]
    var firstTurn : Bool
    var matchCount : Int
    var gameScore : Int
    var delegate : GameModelDelegate?
    
    
    //tiledata structure
    struct TileData {
        
        //tiledata properties
        var pic : UIImage
        var picId : Int
        func description() -> String {
            return String(picId)
            }
    
    }
    
    //gamemodel initilizer
    init(numOfTiles: Int, imgArray: [UIImage]){
        println("initialized")
        lastTileIndex = nil
        secondLastTileIndex = nil
        matchCount = 0
        gameScore = 0
        firstTurn = true
        gameState = [TileData]()
        //delegate = GameModelDelegate?()
        reset(numOfTiles, imageArray: imgArray)
    }
    
    func reset(numOfTiles: Int, imageArray: [UIImage]){
        lastTileIndex = nil
        secondLastTileIndex = nil
        matchCount = 0
        gameScore = 0
        firstTurn = true
        gameState = [TileData]()
        var curId = 0
        var maxId = imageArray.count - 1
        var i = 0
        while i < numOfTiles/2 {
            if curId > maxId{
                curId = 0
            }
            gameState.append(TileData(pic: imageArray[curId], picId: curId))
            gameState.append(TileData(pic: imageArray[curId], picId: curId))
            curId++
            i++
        }
        println(description())
        //gameState.shuffle()
        gameState = shuffle(gameState)
        //println("game model reset")
    }
    
    func shuffle<C: MutableCollectionType where C.Index == Int>(var list: C) -> C {
        let c = count(list)
        if c < 2 { return list }
        for i in 0..<(c - 1) {
            let j = Int(arc4random_uniform(UInt32(c - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
    
//     func shuffle(){
//        for var i = gameState.count - 1; i > 0; i-- {
//            var j = Int(arc4random_uniform(UInt32(i - 1)))
//            var current = gameState.removeAtIndex(i)
//            gameState.insert(current, atIndex: i)
//            gameState[j] = current
//            swap(&gameState[i], &gameState[j])
//        }
//    }
    
    func description() -> String {
        var info = ""
        for img in gameState {
            var theid = img.picId
            info+="\(theid): "
        }
        return info
    }
    
    func pushTileIndex(tileIndex: Int){
        //TileView.revealImage(TileView.viewWithTag(tileIndex))
        if !firstTurn && (tileIndex != lastTileIndex) {
            var tappedData = gameState[tileIndex - 1]
            var prevTappedData = gameState[lastTileIndex! - 1]
            if prevTappedData.picId == tappedData.picId {
                gameScore += 200
                matchCount++
                self.delegate!.didMatchTile(self, tileIndex: tileIndex, previousTileIndex: lastTileIndex!)
                self.delegate!.gameDidComplete(self)
                self.delegate!.scoreDidUpdate(self, newScore: gameScore)
            }
            else{
                gameScore -= 100
                self.delegate!.didFailToMatchTile(self, tileIndex: tileIndex, previousTileIndex: lastTileIndex!)
                self.delegate!.scoreDidUpdate(self, newScore: gameScore)
            }
            firstTurn = true
            
        }
        else if (!firstTurn && tileIndex == lastTileIndex){
            println("Same tile tapped")
        }
        
        else{
            //println("tap number \(firstTurn)")
            firstTurn = false
        }
        //Should i be pushing the tile index if its the second case
        secondLastTileIndex = lastTileIndex
        lastTileIndex = tileIndex
    }
    

}