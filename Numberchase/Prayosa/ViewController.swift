//
//  ViewController.swift
//  Prayosa
//
//  Created by Panth Patel on 07/01/16.
//  Copyright © 2016 Panth Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ficardimageview: UIImageView!
    @IBOutlet weak var secardimageview: UIImageView!
    @IBOutlet weak var thcardimageview: UIImageView!
    @IBOutlet weak var focardimageview: UIImageView!
    
    @IBOutlet weak var randomnolabel: UILabel!
    @IBOutlet weak var gamescorelabel: UILabel!
    
    
    var a:[String]=["dice0","dice1","dice2","dice3","dice4","dice5","dice6"]
    var frn:Int = Int(arc4random_uniform(6))+1
    var srn:Int = Int(arc4random_uniform(6))+1
    var trn:Int = Int(arc4random_uniform(6))+1
    var forn:Int = Int(arc4random_uniform(6))+1
    var rno:Int = Int(arc4random_uniform(11))+2
    
    
    var score=0
    var Highscore=0
    
    var fcardstring:String = ""
    var scardstring:String = ""
    var tcardstring:String = ""
    var focardstring:String = ""
    
    var fb=false
    var sb=false
    var tb=false
    var fob=false
    var fb1=false
    var sb1=false
    var tb1=false
    var fob1=false
    
    var timer1=NSTimer()
    var timer2=NSTimer()
    var timer3=NSTimer()
    var timercount=0
    var timer4=NSTimer()
    var timerrunning=false
    
    var position:CGPoint?
    
    
   
    
    
    func generateno()
    {
        frn=Int(arc4random_uniform(6))+1
        srn=Int(arc4random_uniform(6))+1
        trn=Int(arc4random_uniform(6))+1
        forn=Int(arc4random_uniform(6))+1
        rno=Int(arc4random_uniform(11))+2
        
        
        print(frn ,srn ,trn ,forn," ", rno);
        
        fcardstring=a[frn]
        scardstring=a[srn]
        tcardstring=a[trn]
        focardstring=a[forn]
        
        ficardimageview.layer.borderWidth=0
        secardimageview.layer.borderWidth=0
        thcardimageview.layer.borderWidth=0
        focardimageview.layer.borderWidth=0
        
        
        var degrees: Float = 12.0
        
        var transform3D: CATransform3D = CATransform3DIdentity
        transform3D.m34 = 1.0 / 250
        transform3D = CATransform3DRotate(transform3D, 12, 0, 1,0)
        // perspective transform on y-axis
        ficardimageview.layer.transform = transform3D
        secardimageview.layer.transform = transform3D
        thcardimageview.layer.transform = transform3D
        focardimageview.layer.transform = transform3D
        
        
        
        UIView.animateWithDuration(1, animations: {
            self.randomnolabel.layer.opacity=0
        })
        
       
       UIView.animateWithDuration(1, animations: {
            self.randomnolabel.layer.opacity=1
        })
        
        var rotationAndPerspectiveTransform: CATransform3D = CATransform3DIdentity
        rotationAndPerspectiveTransform.m34 = 1.0 / -500
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 360 / 0.6, 0.01, 1, 0.01)
        UIView.animateWithDuration(1.0, animations: {() -> Void in
            self.ficardimageview.layer.anchorPoint = CGPointMake(0.5, 0)
            self.secardimageview.layer.anchorPoint = CGPointMake(0.5, 0)
            self.thcardimageview.layer.anchorPoint = CGPointMake(0.5, 0)
            self.focardimageview.layer.anchorPoint = CGPointMake(0.5, 0)
            self.ficardimageview.layer.transform = rotationAndPerspectiveTransform
            self.secardimageview.layer.transform = rotationAndPerspectiveTransform
            self.thcardimageview.layer.transform = rotationAndPerspectiveTransform
            self.focardimageview.layer.transform = rotationAndPerspectiveTransform
            }, completion: {(finished: Bool) -> Void in
                
                // code is executed when flip is completed
        })
        
        
        
        
        
        self.ficardimageview.image=UIImage(named: fcardstring)
        self.secardimageview.image=UIImage(named: scardstring)
        self.thcardimageview.image=UIImage(named: tcardstring)
        self.focardimageview.image=UIImage(named: focardstring)
        
        
        fb=false; sb=false; tb=false; fob=false
        
        condition(frn, x: srn, y: trn, z: forn);
        
        
        
        
        
        
        
        
        
        print(fb ,sb , tb, fob)
        
        
    }
    
    func abc()
    {
        abcd(frn, f: srn, g: trn, h: forn)
    }
    
    func abcd(e:Int,f:Int,g:Int,h:Int)
    {
        
        
        if((e+f==rno || e+g==rno || e+h==rno || f+g==rno || f+h==rno || g+h==rno) &&  ((fb==false && sb==false && tb==false && fob==false) || (fb==true && sb==false && tb==false && fob==false) || (fb==false && sb==true && tb==false && fob==false)
            || (fb==false && sb==false && tb==true && fob==false)

            || (fb==false && sb==false && tb==false && fob==true)))
            
        {
            print("abc")
            gameend()
            
        }
    }
    
    func bounce()
    {
        
        randomnolabel.text=String(rno)
        
    }
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ficardimageview.layer.cornerRadius=10
        secardimageview.layer.cornerRadius=10
        thcardimageview.layer.cornerRadius=10
        focardimageview.layer.cornerRadius=10
        
        var highscoredefault = NSUserDefaults.standardUserDefaults()
    if(highscoredefault.valueForKey("Highscore") != nil)
       {
        
        Highscore = highscoredefault.valueForKey("Highscore")
        as! NSInteger!
        }
        
        generateno();
        timer1=NSTimer . scheduledTimerWithTimeInterval(0.05, target: self, selector: "bounce", userInfo: nil, repeats: true)
        
        
        
        timer2=NSTimer .scheduledTimerWithTimeInterval(2.5, target: self, selector: "generateno", userInfo: nil, repeats: true)
        
        timer3=NSTimer .scheduledTimerWithTimeInterval(2.49, target: self, selector: "abc", userInfo: nil, repeats: true)
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    @IBAction func firstcvitapped(sender: UITapGestureRecognizer)
    {
        fb=true;
        fb1=true
       
        ficardimageview.layer.borderWidth=2
        ficardimageview.layer.borderColor = UIColor.orangeColor().CGColor
      
    
        
        
        print("tapped1 \(fb)")
        condition(frn, x:srn, y:trn, z:forn);
        print("1 \(fb)")
        
        
    }
    
    @IBAction func secondcvitapped(sender: UITapGestureRecognizer)
    {
        
        sb=true;
        sb1=true
        
        secardimageview.layer.borderWidth=2
        secardimageview.layer.borderColor = UIColor.orangeColor().CGColor
        
        
        print("tapped2 \(sb)")
        condition(frn, x:srn, y:trn, z:forn);
        print("2 \(sb)")
        
        
    }
    
    @IBAction func thirdcvitapped(sender: UITapGestureRecognizer)
    {
        tb=true;
        tb1=true
    
        thcardimageview.layer.borderWidth=2
        thcardimageview.layer.borderColor = UIColor.orangeColor().CGColor
        
        print("tapped3 \(tb)")
        condition(frn, x:srn, y:trn, z:forn);
        print("3 \(tb)")
        
    }
    
    
    @IBAction func fourthcvitapped(sender: UITapGestureRecognizer)
    {
        fob=true;
        fob1=true
        
        focardimageview.layer.borderWidth=2
        focardimageview.layer.borderColor = UIColor.orangeColor().CGColor
        
        print("tapped4 \(fob)")
        condition(frn, x:srn, y:trn, z:forn);
        print("4 \(fob)")
        
    
    }
    
    
    func condition(w:Int,x:Int,y:Int,z:Int)
        
    {
        
        
        if(w+x==rno)
        {
            print(fb, sb, 12)
            
            if(fb==true && sb==true)
            {
                
                
                
                print("tapped12")
                score+=2
                gamescorelabel.text=String(score)
               
                
                
            }
            else if(fb==true)
            {
                fb=true
            }
            else if(sb==true)
            {
                sb=true
            }
            
        }
        else if(fb==false)
        {
            fb=false
        }
            
        else if(sb==false)
        {
            sb=false;
        }
        else
        {
            print("else 12")
            gameend()
            
        }
        
        
        
        
        if(w+y==rno)
        {
            print(fb, tb, 13)
            if(fb==true && tb==true)
            {
                
                
                
                print("tapped13")
                score+=2
                gamescorelabel.text=String(score)
               
                
            }
            else if(fb==true)
            {
                fb=true
            }
            else if(tb==true)
            {
                tb=true
            }
            
            
        }
        else if(fb==false)
        {
            fb=false
        }
            
        else if(tb==false)
        {
            tb=false;
        }
        else
        {
            print("else 13")
            gameend()
            
        }
        
        
        
        if(w+z==rno)
        {
            print(fb, fob, 14)
            if(fb==true && fob==true)
            {
                
                
                
                print("tapped14")
                score+=2
                gamescorelabel.text=String(score)
                
                
            }
            else if(fb==true)
            {
                fb=true
            }
            else if(fob==true)
            {
                fob=true
            }
            
            
        }
        else if(fb==false)
        {
            fb=false
        }
            
        else if(fob==false)
        {
            fob=false;
        }
        else
        {
            print("else 14")
            gameend()
            
        }
        
        
        if(x+y==rno)
        {
            print(sb, tb, 23)
            if(sb==true && tb==true)
            {
                
                
                
                print("tapped23")
                score+=2
                gamescorelabel.text=String(score)
               
                
            }
            else if(sb==true)
            {
                sb=true
            }
            else if(tb==true)
            {
                tb=true
            }
            
            
        }
        else if(sb==false)
        {
            sb=false
        }
            
        else if(tb==false)
        {
            tb=false;
        }
        else
        {
            print("else 23")
            gameend()
            
        }
        
        
        if(x+z==rno)
        {
            print(sb, fob, 24)
            if(sb==true && fob==true)
            {
                
                
                
                print("tapped24")
                score+=2
                gamescorelabel.text=String(score)
               
                
            }
            else if(sb==true)
            {
                sb=true
            }
            else if(fob==true)
            {
                fob=true
            }
            
            
        }
        else if(sb==false)
        {
            sb=false
        }
            
        else if(fob==false)
        {
            fob=false;
        }
        else
        {
            print("else 24")
            gameend()
            
        }
        
        if(y+z==rno)
        {
            print(tb, fob, 24)
            if(tb==true && fob==true)
            {
                
                
                
                print("tapped34")
                score+=2
                gamescorelabel.text=String(score)
                
                
            }
            else if(tb==true)
            {
                tb=true
            }
            else if(fob==true)
            {
                fob=true
            }
            
            
        }
        else if(tb==false)
        {
            tb=false
        }
            
        else if(fob==false)
        {
            fob=false;
        }
        else
        {
            print("else 34")
            gameend()
            
        }
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    func gameend()
    {
        
        
      
        self.performSegueWithIdentifier("customSegue", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        var destviewcontroller : Endgameview = segue.destinationViewController  as!  Endgameview
        
        destviewcontroller.fnlgamescorelabelvalue = score
        if(score > Highscore)
        {
            Highscore = score
        }
        
        var highscoredefault = NSUserDefaults.standardUserDefaults()
        highscoredefault.setValue(Highscore, forKey: "Highscore")
        
        destviewcontroller.highscorelabelvalue = Highscore
        
    }
    
    
   

   

    
    
}

