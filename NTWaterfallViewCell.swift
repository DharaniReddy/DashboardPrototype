//
//  NTWaterfallViewCell.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 6/30/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import UIKit

class NTWaterfallViewCell :UICollectionViewCell, NTTansitionWaterfallGridViewProtocol{
    var imageName : String?
    var imageViewContent : UIImageView = UIImageView()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
        contentView.addSubview(imageViewContent)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageViewContent.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        imageViewContent.image = UIImage(named: imageName!)
    }
    
    func snapShotForTransition() -> UIView! {
        let snapShotView = UIImageView(image: self.imageViewContent.image)
        snapShotView.frame = imageViewContent.frame
        return snapShotView
    }
}

class NTWaterfallViewCellType1 :UICollectionViewCell, NTTansitionWaterfallGridViewProtocol{
   
    var imageName : String?
    var imageViewContent : UIImageView = UIImageView()
    
    var containerView = UIView()
    
    var titleLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        containerView.backgroundColor = UIColor.lightGray
        
        containerView.addSubview(imageViewContent)
        contentView.addSubview(containerView)
        contentView.addSubview(titleLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        imageViewContent.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height - 60)
        imageViewContent.contentMode = .scaleAspectFill
        imageViewContent.image = UIImage(named: imageName!)
        imageViewContent.clipsToBounds = true
        
        containerView.clipsToBounds = true
        containerView.frame = CGRect(x: 0, y: 5, width: frame.size.width, height: frame.size.height)
        containerView.layer.cornerRadius = 15
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        
        titleLabel.frame = CGRect(x: 5, y: frame.size.height - 50, width: frame.width - 20, height: 50)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
       // titleLabel.text = "Coach"
        
    }
    
    func snapShotForTransition() -> UIView! {
        let snapShotView = UIImageView(image: self.imageViewContent.image)
        snapShotView.frame = imageViewContent.frame
        return snapShotView
    }
}
