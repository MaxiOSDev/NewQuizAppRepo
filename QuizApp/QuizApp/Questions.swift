//
//  Questions.swift
//  QuizApp
//
//  Created by Max Ramirez on 8/24/17.
//  Copyright © 2017 MaxRamirez. All rights reserved.
//

import Foundation
import GameKit
class Trivia {

    var question = [String]()
    var answers = [String]()
    var correctAnswer = Int()
    
    
    
}

var questions: [Trivia] = [Trivia(question: "This was the only US President to serve more than two consecutive terms.",
                                  answers: ["George Washington","Franklin D. Roosevelt","Franklin D. Roosevelt","Andrew Jackson"], correctAnswer: 2),
                           Trivia(question: "Which of the following countries has the most residents?",
                                  answers: ["Nigeria","Russia","Iran","Vietnam"], correctAnswer: 1),
                           Trivia(question: "In what year was the United Nations founded?",
                                  answers: ["1918","1919","1945","1954"], correctAnswer: 3),
                           Trivia(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
                                  answers: ["Paris","Washington D.C.","New York City","Boston"], correctAnswer: 3),
                           Trivia(question: "Which nation produces the most oil?",
                                  answers: ["Iran","Iraq","Brazil","Canada"], correctAnswer: 4),
                           Trivia(question: "Which country has most recently won consecutive World Cups in Soccer?",
                                  answers: ["Italy","Brazil","Argentina","Spain"], correctAnswer: 2),
                           Trivia(question: "Which of the following rivers is longest?",
                                  answers: ["Yangtze","Mississippi","Congo","Mekong"], correctAnswer: 2),
                           Trivia(question: "Which city is the oldest?",
                                  answers: ["Mexico City","Cape Town","San Juan","Sydney"], correctAnswer: 1),
                           Trivia(question: "Which country was the first to allow women to vote in national elections?",
                                  answers: ["Poland","United States","Sweden","Senegal"], correctAnswer: 2),
                           Trivia(question: "Which of these countries won the most medals in the 2012 Summer Games?",
                                  answers: ["France","Germany","Japan","Great Britian"], correctAnswer: 4)]






//
//func randomTrivia() -> String {
//    var myArray = [String]()
//    let randomQuestion = String(arc4random_uniform(UInt32(questions.count)))
//    for trivia in questions {
//        myArray.append(trivia.question)
//    }
//    return randomQuestion
//}

// Helper Functions

































