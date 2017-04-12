//
//  ChallengeDetailVC.swift
//  TeamFitnessApp
//
//  Created by Patrick O'Leary on 4/9/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class ChallengeDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var challenge: Challenge? = nil
    
    let titleLabel = TitleLabel()
    let startDateLabel = FitnessLabel()
    let endDateLabel = FitnessLabel()
    let goalPieChart = CustomPieChartView()
    let leadersTable = UITableView()
    let leaders = [User]()
    
//    var goal: [String:Double]
//    var creator: String?
//    var userUIDs = [String]()
//    var isPublic: Bool?
//    var teamID: String?
//    var id: String?
//    var name: String

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = FitnessView()
        setupViews()
        getLeaders()
        
        leadersTable.register(FitnessCell.self, forCellReuseIdentifier: "fitnessCell")
        leadersTable.delegate = self
        leadersTable.dataSource = self

    }

    func setupViews() {
        self.view.addSubview(titleLabel)
        titleLabel.setConstraints(toView: self.view)
        titleLabel.setText(toString: "Challenge Info")
        
        self.view.addSubview(goalPieChart)
        goalPieChart.translatesAutoresizingMaskIntoConstraints = false
        goalPieChart.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        goalPieChart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        goalPieChart.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        goalPieChart.heightAnchor.constraint(equalTo: goalPieChart.widthAnchor).isActive = true
        getChartData()
        
        self.view.addSubview(leadersTable)
        leadersTable.translatesAutoresizingMaskIntoConstraints = false
        leadersTable.topAnchor.constraint(equalTo: goalPieChart.bottomAnchor).isActive = true
        leadersTable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        leadersTable.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        leadersTable.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        leadersTable.backgroundColor = UIColor.clear
        
    }
    
    func setChallenge(challenge: Challenge) {
        self.challenge = challenge
        getChartData()
        self.titleLabel.setText(toString: challenge.name)
    }
    
    func getChartData() {
        
        guard let goalType = challenge?.goal?.type, let startDate = challenge?.startDate, let goalValue = challenge?.goal?.value else {return}
        switch goalType {
        case .caloriesBurned:
            HealthKitManager.sharedInstance.getCalories(fromDate: startDate, toDate: Date(), completion: { (calories, error) in
                if let calories = calories {
                    DispatchQueue.main.async {
                        self.goalPieChart.setData(goal: goalValue, current: calories)
                    }
                }
            })
        case.distance:
            HealthKitManager.sharedInstance.getDistance(fromDate: startDate, toDate: Date(), completion: { (distance, error) in
                if let distance = distance {
                    DispatchQueue.main.async {
                        self.goalPieChart.setData(goal: goalValue, current: distance)
                    }
                }
            })
        case.exerciseTime:
            HealthKitManager.sharedInstance.getExerciseTime(fromDate: startDate, toDate: Date(), completion: { (time, error) in
                if let time = time {
                    DispatchQueue.main.async {
                        self.goalPieChart.setData(goal: goalValue, current: time)
                    }
                }
            })
        case .stepCount:
            HealthKitManager.sharedInstance.getSteps(fromDate: startDate, toDate: Date(), completion: { (steps, error) in
                if let steps = steps {
                    DispatchQueue.main.async {
                        self.goalPieChart.setData(goal: goalValue, current: steps)
                    }
                }
            })
        }
    }
    
    func getLeaders() {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fitnessCell", for: indexPath) as! FitnessCell
        cell.setLabels(forUser: leaders[indexPath.row])
        return cell
    }
}
