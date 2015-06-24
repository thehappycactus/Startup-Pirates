//
//  NSMutableStrong.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 6/24/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {

   public func setAsLink(textToFind:String, linkURL:String) -> Bool {

       let foundRange = self.mutableString.rangeOfString(textToFind)
       if foundRange.location != NSNotFound {
           self.addAttribute("NSLinkAttributeName", value: linkURL, range: foundRange)
           return true
       }
       return false
   }
}