//
//  User.swift
//  TeamFitnessApp
//
//  Created by Lawrence Herman on 4/4/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation


struct User {

    var name: String
    var sex: String
    var height: Float
    var weight: Int
    var teamIDs = [String]()
    var challengeIDs = [String]()
    var goals = [Goal]()
    var email: String? = nil
    var uid: String? = nil
    var oldChallengeIDs = [String]()
    var trophies = [String:Int]()

    init(uid: String, dict: [String: Any]) {
        self.uid = uid
        self.name = dict["name"] as? String ?? ""
        self.sex = dict["gender"] as? String ?? ""
        self.height = dict["height"] as? Float ?? 0.0
        self.weight = dict["weight"] as? Int ?? 0
        self.email = dict["email"] as? String ?? ""

        let challengeDict = dict["challenges"] as? [String: Bool] ?? [:]
        for (challengeID, _) in challengeDict {
            self.challengeIDs.append(challengeID)
        }

        let goalDict = dict["goals"] as? [String:Double] ?? [:]
        for (key, value) in goalDict {
            if let goalType = GoalType(rawValue: key) {
                let goal = Goal(type: goalType, value: value)
                goals.append(goal)
            }
        }

        self.trophies = dict["trophies"] as? [String:Int] ?? [:]

        let oldChallengeDict = dict["oldChallenges"] as? [String: Bool] ?? [:]
        for (challengeID, _) in oldChallengeDict {
            self.oldChallengeIDs.append(challengeID)
        }

        let teamDict = dict["teams"] as? [String: Bool] ?? [:]
        for (teamID, _) in teamDict {
            self.teamIDs.append(teamID)
        }
    }


    init(name: String, sex: String, height: Float, weight: Int, teamIDs: [String], challengeIDs: [String], goals: [Goal], email: String? = nil, uid: String? = nil) {

        self.name = name
        self.sex = sex
        self.height = height
        self.weight = weight
        self.teamIDs = teamIDs
        self.challengeIDs = challengeIDs
        self.goals = goals
        self.email = email
        self.uid = uid

    }

    mutating func set(UID uid: String) {
        self.uid = uid
    }


    mutating func update(name: String, weight: Int, goals: [Goal]) {
        self.name = name
        self.weight = weight
        self.goals = goals
        
    }
}
