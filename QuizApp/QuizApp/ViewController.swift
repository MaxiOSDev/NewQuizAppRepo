//
//  ViewController.swift
//  QuizApp
//
//  Created by Max Ramirez on 8/24/17.
//  Copyright © 2017 MaxRamirez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!

   let trivia = Trivia()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.gray
        questionLabel.textColor = .white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func answer1(_ sender: Any) {
        
        
        
        
        
    }
    @IBAction func answer2(_ sender: Any) {
        
        
        
        
        
    }
    

}

