//
//  Endgameview.swift
//  Prayosa
//
//  Created by Panth Patel on 19/02/16.
//  Copyright © 2016 Panth Patel. All rights reserved.
//

import Foundation
import UIKit



class Endgameview: UIViewController
{
    
    
    @IBOutlet weak var fnlgamescorelabel: UILabel!
    var fnlgamescorelabelvalue=Int()
    
    @IBOutlet weak var highscorelabel: UILabel!
    var highscorelabelvalue=Int()
    
    
    override func viewDidLoad() {
       
        fnlgamescorelabel.text = String(fnlgamescorelabelvalue)
        
        highscorelabel.text = String(highscorelabelvalue)
    }
    
    
}

