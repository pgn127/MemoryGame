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
extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

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
    //var delegate : GameModelDelegate
    
    
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
        //delegate = GameModelDelegate
        reset(numOfTiles, imageArray: imgArray)
    }
    
    func reset(numOfTiles: Int, imageArray: [UIImage]){
        lastTileIndex = nil
        secondLastTileIndex = nil
        matchCount = 0
        gameScore = 0
        firstTurn = true
        var curId = 0
        var maxId = imageArray.count - 1
        for var i=0; i<numOfTiles; i++ {
            if curId > maxId{
                curId = 0
            }
            gameState.append(TileData(pic: imageArray[curId], picId: curId))
            gameState.append(TileData(pic: imageArray[curId], picId: curId))
            curId++
        }
        gameState.shuffle()
        
    }
    
    func description() -> String {
        var info = ""
        for img in gameState {
            var theid = img.picId
            info+="\(theid): "
            
        }
        return info
    }
    
    func pushTileIndex(tileIndex: Int){
        secondLastTileIndex = lastTileIndex
        lastTileIndex = tileIndex
    }
    

}