//
//  Goal.swift
//  TeamFitnessApp
//
//  Created by Lawrence Herman on 4/5/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation

<<<<<<< HEAD
enum Goal {
    
    case distance(Float)
    case stepCount(Int)
    case caloriesBurned(Int)
    case excerciseTime(Float)
    case weight(Float)

    func stringValue() -> String {
        switch self {
        case .distance:
            return "Distance"
        case .stepCount:
            return "Step Count"
        case .caloriesBurned:
            return "Calories Burned"
        case .excerciseTime:
            return "Excersize Time"
        case .weight:
            return "Weight"
        }
    }
=======

enum GoalType: String {
    case distance, stepCount, caloriesBurned, exerciseTime
}


struct Goal {
  var type: GoalType!
  var value: Double!

  init(type: GoalType, value: Double) {
    self.type = type
    self.value = value
  }

>>>>>>> master
}

