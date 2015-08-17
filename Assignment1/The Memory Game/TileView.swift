//
//  TileView.swift
//  The Memory Game
//
//  Created by Pamela Needle on 8/15/15.
//  Copyright (c) 2015 Pamela Needle. All rights reserved.
//
import UIKit
import Foundation

protocol TileViewDelegate{
    func didSelectTile(tileView: TileView)
}

class TileView: UIView{
   
    var tileIndex: Int 
    //var img: UIImage? = UIImage(named: "lake")
    var img: UIImage
    var imageView: UIImageView
    //var delegate : TileViewDelegate
    
    required init(coder aDecoder: NSCoder) {
        tileIndex = 0
        imageView = UIImageView(frame:CGRectMake(0, 0, 100, 100))
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.img = UIImage(named: "question")!
        imageView.image = UIImage(named: "question")
        super.init(coder: aDecoder)
        
        let widthConstraint = NSLayoutConstraint(item: self.imageView,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0)
        let heightConstraint = NSLayoutConstraint(item: self.imageView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 0)
        let topConstraint = NSLayoutConstraint(item: self.imageView,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 0)
        let leftConstraint = NSLayoutConstraint(item: self.imageView,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 0)
        self.addSubview(imageView)
        self.addConstraints([widthConstraint, heightConstraint, topConstraint, leftConstraint])
        
       
    }
    
    func revealImage(){
        imageView.image = img
    }
    
    func coverImage(){
        imageView.image = UIImage(named: "question")
    }
    
    func hideTiles(){
        imageView.alpha = 0
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        revealImage()
    }
    
    
    
}
