//
//  ViewController.swift
//  Calculate
//
//  Created by Сергей Анпилогов on 17.08.2022.
//

import UIKit

enum Operation: String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Myltiply = "*"
    case NULL = "NUll"
    
}

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "0"
        
    }
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            textLabel.text = runningNumber
        }
    }
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        textLabel.text = "0"
 
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
            runningNumber += "."
            textLabel.text = runningNumber
        }
    }
    @IBAction func equelPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    @IBAction func multiplayPressed(_ sender: RoundButton) {
        operation(operation: .Myltiply)
    }
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                    
                } else  if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == .Myltiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                } else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                textLabel.text = result
            }
            currentOperation = operation
            
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

