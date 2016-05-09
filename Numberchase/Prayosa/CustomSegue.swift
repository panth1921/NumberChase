//
//  CustomSegue.swift
//  Prayosa
//
//  Created by Panth Patel on 18/02/16.
//  Copyright © 2016 Panth Patel. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        
        let sourcevc = self.sourceViewController
        let destvc = self.destinationViewController
        
        sourcevc.presentViewController(destvc, animated: false, completion: nil)
    }

}
