//
//  ViewController.swift
//  The Memory Game
//
//  Created by Pamela Needle on 8/14/15.
//  Copyright (c) 2015 Pamela Needle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cat: UIImageView!
    
    @IBOutlet weak var bald: UIImageView!
    
    @IBOutlet weak var lake: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("test")
        var test = [cat, bald, lake]
        var model = GameModel(numOfTiles: 16,imgArray: test)
        println(model.description())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

