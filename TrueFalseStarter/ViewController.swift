//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox
import AVFoundation


class ViewController: UIViewController {
    
    let incorrectSystemSoundID: SystemSoundID = 1332
    let correctSystemSoundID: SystemSoundID = 1327
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var seconds = 15
    var timer = Timer()
    var isTimerRunning = false
    var gameSound: SystemSoundID = 0

    
    //Outlets of Labels and Buttons
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var nextQuestion: RoundButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        resetTrivia()
        displayQuestion()
        runTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if seconds < 1 { //This will decrement(count down)the seconds.
            timer.invalidate()
            timerLabel.textColor = UIColor.white
            resultLabel.textColor = UIColor.orange
            resultLabel.text = "YOU RAN OUT OF TIME"
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(myTimerTick), userInfo: nil, repeats: false)
        } else if seconds <= 5 {
            timerLabel.textColor = UIColor.red
            seconds -= 1
            timerLabel.text = "\(seconds)"
        } else {
            seconds -= 1
            timerLabel.text = "\(seconds)" //This will update the label.
        }
        
    }
    
    func myTimerTick() {
        trueButton.isEnabled = false
        falseButton.isEnabled = false
        option3.isEnabled = false
        option4.isEnabled = false
    }

    func displayQuestion() {
        // Displays different question at start of each round without repeating
        indexOfSelectedQuestion = (Int(arc4random_uniform(UInt32(trivia.count))))
        let questionDictionary = trivia[indexOfSelectedQuestion]
        questionField.text = questionDictionary.question
        trueButton.setTitle(questionDictionary.answers[0], for: UIControlState.normal)
        falseButton.setTitle(questionDictionary.answers[1], for: UIControlState.normal)
        option3.setTitle(questionDictionary.answers[2], for: UIControlState.normal)
        option4.setTitle(questionDictionary.answers[3], for: UIControlState.normal)
        playAgainButton.isHidden = true
        
        // Array of buttons to increment through for enabling buttons
        let buttonsArray = [trueButton, falseButton, option3, option4]
        for button in buttonsArray {
            button?.isEnabled = true
        }
 
    }
    

    func displayScore() {
        // Hide the answer buttons
        trueButton.isHidden = true
        falseButton.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
        timerLabel.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        nextQuestion.isHidden = true
        resultLabel.isHidden = true
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {

        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.correctAnswer
        let buttonsArray = [trueButton, falseButton, option3, option4]
        // Checking to see if they senders choice is correct or incorrect
        if (sender === trueButton &&  correctAnswer == 1) || (sender === falseButton && correctAnswer == 2)
        || (sender === option3 && correctAnswer == 3) || (sender === option4 && correctAnswer == 4) {
            correctQuestions += 1
            timer.invalidate()
            resultLabel.textColor = UIColor.white
            resultLabel.text = "Correct!"
            AudioServicesPlaySystemSound(correctSystemSoundID)
        } else {
            // Display the correct answer when an incorrect
            timer.invalidate()
            resultLabel.textColor = UIColor.orange
            AudioServicesPlaySystemSound(incorrectSystemSoundID)
            resultLabel.text = "Sorry, incorrect! The correct answer is\n \(trivia[indexOfSelectedQuestion].answers[correctAnswer - 1])"
        }
        trivia.remove(at: indexOfSelectedQuestion)
        
        // Increment through buttons array to not have other answer choices enabled
        for button in buttonsArray {
            if sender != button {
                button?.isEnabled = false
            }
        }
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
            
        } else {
            // Continue game
            displayQuestion()
            resultLabel.text = nil
            runTimer()
        }
    }
    
    @IBAction func proximoQuestionButton(_ sender: RoundButton) {
        loadNextRoundWithDelay(seconds: 0)
        timer.invalidate()
        seconds = 15
        timerLabel.text = "\(seconds)"
        updateTimer()
        
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        trueButton.isHidden = false
        falseButton.isHidden = false
        option3.isHidden = false
        option4.isHidden = false
        nextQuestion.isHidden = false
        resultLabel.isHidden = false
        timerLabel.isHidden = false
        questionsAsked = 0
        correctQuestions = 0
        resetTrivia()
        nextRound()
        
    }

    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
           
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

