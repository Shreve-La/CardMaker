//
//  Util.swift
//  cardMaker
//
//  Created by swcl on 2017-08-24.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

import Foundation
import os.log



class Util {
    internal static func saveCards(cards: [Card]) {
        
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(cards, toFile: Card.ArchiveURL.path)
            
            
            if isSuccessfulSave {
                os_log("Cards successfully saved", log: OSLog.default, type: .debug)
            }
            else {
                os_log("Failed to save cards...", log: OSLog.default, type: .error)
            }
            print("cards array saved")
            
        }
        
    }
    
}

