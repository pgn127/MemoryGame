//
//  ViewController.swift
//  The Memory Game
//
//  Created by Pamela Needle on 8/14/15.
//  Copyright (c) 2015 Pamela Needle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GameModelDelegate, TileViewDelegate {


    @IBOutlet weak var scoreLabel: UILabel!
    var tile: TileView?
    var model: GameModel?
    let numOfTiles = 12
    var tileViewArray: [TileView] = []
//    var img1 = UIImage(named: "lake")
//    var img2 = UIImage(named: "cathedral")
//    var img3 = UIImage(named: "baldhill")
    var imageArray = [UIImage(named: "lake")!, UIImage(named: "cathedral")!, UIImage(named: "baldhill")!]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageArray = [img1!,img2!,img3!]
        model = GameModel(numOfTiles: numOfTiles,imgArray: imageArray)
        model!.delegate = self as GameModelDelegate
        println(model!.description())
        setUpTiles()
        //var test = [cat, bald, lake]
//        if let pic = img1{
//            if let pic2 = img2{
//                if let pic3 = img3{
                    //imageArray = [pic,pic2,pic3]
                    //model = GameModel(numOfTiles: numOfTiles,imgArray: imageArray)
                    //model!.delegate = self as GameModelDelegate
                    //println(model!.description())
                    //setUpTiles(numOfTiles: numOfTiles, model: model)
                    //setUpTiles()
                //}
            //}
        //}
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func setUpTiles(){
        for var i = 0; i<numOfTiles; i++ {
            tile = self.view.viewWithTag(i+1) as? TileView
            tileViewArray.append(tile!)
            var curTileData = model!.gameState[i]
            tile!.img = curTileData.pic
            tile!.tileHidden = false
            tile!.imageView.alpha = 1
            tile!.tileIndex = i+1
            tile!.delegate = self as TileViewDelegate
            tile!.coverImage()
        }
        
    }
    
    func didSelectTile(tileView: TileView){
        //println("function reached")
        var tappedIndex = tileView.tileIndex
        println("tiletapped \(tappedIndex)")
        if !tileView.tileHidden{
        model!.pushTileIndex(tappedIndex)
        }
    }
    
    func restartGame(gameModel: GameModel){
        gameModel.reset(self.numOfTiles, imageArray: imageArray)
        self.setUpTiles()
    }
    
    func gameDidComplete(gameModel: GameModel){
        println("matches \(gameModel.matchCount)")
        if gameModel.matchCount == (numOfTiles/2) {
            //display alert
            var newGameAlert = UIAlertController(title: "New Game", message: "Your score was \(gameModel.gameScore)!", preferredStyle: UIAlertControllerStyle.Alert)
            newGameAlert.addAction(UIAlertAction(title: "New Game", style: .Default, handler: { (action:UIAlertAction!) in
                self.restartGame(gameModel)
            }))
            self.presentViewController(newGameAlert, animated: true, completion: nil)
            
        }
    }
    
    func didMatchTile(gameModel: GameModel, tileIndex: Int, previousTileIndex: Int){
        
        //var curTileData = model!.gameState[tileIndex - 1]
        //var prevTileData = model!.gameState[previousTileIndex - 1]
        //if prevTileData.picId == curTileData.picId {
            //delay 1 second
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            //println("test")
        
            var curTile = self.view.viewWithTag(tileIndex) as? TileView
            curTile!.hideTiles()
            var prevTile = self.view.viewWithTag(previousTileIndex) as? TileView
            prevTile!.hideTiles()
        //}
        }
        
    }
    
    func didFailToMatchTile(gameModel: GameModel, tileIndex: Int, previousTileIndex: Int){
        //var curTileId = model!.gameState[tileIndex - 1].picId
        //var prevTileId = model!.gameState[previousTileIndex - 1].picId
        //if curTileId != prevTileId {
            //delay 1 second
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            //println("test")
        
            var curTile = self.view.viewWithTag(tileIndex) as? TileView
            curTile!.coverImage()
            var prevTile = self.view.viewWithTag(previousTileIndex) as? TileView
            prevTile!.coverImage()
        }
    }
    
    func scoreDidUpdate(gameModel:GameModel, newScore: Int){
        scoreLabel.text = String("Score: \(newScore)")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

