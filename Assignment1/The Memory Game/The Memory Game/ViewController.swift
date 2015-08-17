//
//  ViewController.swift
//  The Memory Game
//
//  Created by Pamela Needle on 8/14/15.
//  Copyright (c) 2015 Pamela Needle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var tile: TileView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("test")
        
        //var test = [cat, bald, lake]
        var numOfTiles = 12
        var model = GameModel(numOfTiles: numOfTiles,imgArray: [UIImage(named: "lake")!,UIImage(named: "cathedral")!])
        println(model.description())
        for var i = 1; i<=numOfTiles; i++ {
            tile = self.view.viewWithTag(i) as? TileView
            tile!.tileIndex = i
            tile!.img = UIImage(named: "lake")!
//            self.view.addSubview(self.tile!)
        }
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

