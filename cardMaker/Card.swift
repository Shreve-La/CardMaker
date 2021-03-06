//
//  Card.swift
//  cardMaker
//
//  Created by Seantastic31 on 09/08/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

import UIKit
import os.log

class Card: NSObject, NSCoding {
    var team: String?
    var name: String?
    var photo: UIImage?
    var frame: UIImage?
    var pngImage: UIImage?
    var backpngImage: UIImage?
    var position: String?
    var battingDirection: String?
    var throwingHand: String?
    var additionalInfo: String?
    var imgScale: CGFloat = 0.5
    var imgOffSet: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            print(#line, "imgOffSet was set", imgOffSet)
        }
    }
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("cards")
    
    //MARK: Types
    struct PropertyKey {
        static let team = "team"
        static let name = "name"
        static let photo = "photo"
        static let frame = "frame"
        static let pngImage = "pngImage"
        static let backpngImage = "backpngImage"
        static let position = "position"
        static let battingDirection = "battingDirection"
        static let throwingHand = "throwingHand"
        static let additionalInfo = "additionalInfo"
        static let imgScale = "imgScale"
        static let imgOffSet = "imgOffSet"
    }
    
    init?(team: String?, name: String?, photo: UIImage?, frame: UIImage?, pngImage: UIImage?, backpngImage: UIImage?, position: String?, battingDirection: String?, throwingHand: String?, additionalInfo: String?, imgScale: CGFloat, imgOffSet: CGPoint ) {
        self.team = team
        self.name = name
        self.photo = photo
        self.frame = frame
        self.pngImage = pngImage
        self.backpngImage = backpngImage
        self.position = position
        self.battingDirection = battingDirection
        self.throwingHand = throwingHand
        self.additionalInfo = additionalInfo
        self.imgScale = imgScale
        self.imgOffSet = imgOffSet
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(team, forKey: PropertyKey.team)
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(frame, forKey: PropertyKey.frame)
        aCoder.encode(pngImage, forKey: PropertyKey.pngImage)
        aCoder.encode(backpngImage, forKey: PropertyKey.backpngImage)
        aCoder.encode(position, forKey: PropertyKey.position)
        aCoder.encode(battingDirection, forKey: PropertyKey.battingDirection)
        aCoder.encode(additionalInfo, forKey: PropertyKey.additionalInfo)
        aCoder.encode(imgScale, forKey: PropertyKey.imgScale)
        aCoder.encode(imgOffSet, forKey: PropertyKey.imgOffSet)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let team = aDecoder.decodeObject(forKey: PropertyKey.team) as? String else {
            os_log("Unable to decode the team for Card object", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for Card object", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage else {
            os_log("Unable to decode the photo for Card object", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let frame = aDecoder.decodeObject(forKey: PropertyKey.frame) as? UIImage else {
            os_log("Unable to decode the frame image for Card object", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let pngImage = aDecoder.decodeObject(forKey: PropertyKey.pngImage) as? UIImage else {
            os_log("Unable to decode the front png image for Card object", log: OSLog.default, type: .debug)
            return nil
        }
    
        var backpngImage: UIImage?

        if let result = aDecoder.decodeObject(forKey: PropertyKey.backpngImage) as? UIImage {
            backpngImage = result
        }
        
        var position: String?
        
        if let result = aDecoder.decodeObject(forKey: PropertyKey.position) as? String {
            position = result
        }
       
        var battingDirection: String?
        
        if let result = aDecoder.decodeObject(forKey: PropertyKey.battingDirection) as? String {
            battingDirection = result
        }
        
        var throwingHand: String?
        
        if let result = aDecoder.decodeObject(forKey: PropertyKey.throwingHand) as? String {
            throwingHand = result
        }
        
        var additionalInfo: String?
        
        if let result = aDecoder.decodeObject(forKey: PropertyKey.additionalInfo) as? String {
            additionalInfo = result
        }
        
        var imgScale: CGFloat?
        
        if let result = aDecoder.decodeObject(forKey: PropertyKey.imgScale) as? CGFloat {
            imgScale = result
        } else { imgScale = CGFloat(0.5)}
        
        var imgOffSet: CGPoint?
        
        if let result = aDecoder.decodeObject(forKey: PropertyKey.imgOffSet) as? CGPoint {
            imgOffSet = result
        } else { imgOffSet = CGPoint(x:0, y:0) }
        

//        if let newbackpngImage = aDecoder.decodeObject(forKey: PropertyKey.backpngImage) as? UIImage {
//            os_log("Unable to decode the back png Image for Card object", log: OSLog.default, type: .debug)
//            backpngImage = newbackpngImage
//        
//        }

        self.init(team: team, name: name, photo: photo, frame: frame, pngImage: pngImage, backpngImage: backpngImage, position: position, battingDirection: battingDirection, throwingHand: throwingHand, additionalInfo: additionalInfo, imgScale: imgScale!, imgOffSet: imgOffSet! )
 //       self.init(team: team, name: name, photo: photo, frame: frame, pngImage: pngImage, backpngImage: backpngImage)
    }
}
