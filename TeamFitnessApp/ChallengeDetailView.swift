//
//  ChallengeDetailView.swift
//  TeamFitnessApp
//
//  Created by Patrick O'Leary on 4/19/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class ChallengeDetailView: FitnessView {
    
    let topLabel = FitnessLabel()
    let startDateLabel = FitnessLabel()
    let endDateLabel = FitnessLabel()
    let joinButton = FitnessButton()
    
    let goalPieChart = CustomPieChartView()
    let leadersChart = CustomHorizontalBarChart()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadUI()
        setConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
        setConstraints()
    }
    
    func loadUI() {
        self.addSubview(topLabel)
        topLabel.text = "Challenge Info"
        
        self.addSubview(goalPieChart)
        
        self.addSubview(leadersChart)
        
        self.addSubview(joinButton)
        joinButton.isHidden = true
    }
    
    func setConstraints() {
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 75).isActive = true
        topLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        topLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        
        goalPieChart.translatesAutoresizingMaskIntoConstraints = false
        goalPieChart.topAnchor.constraint(equalTo: topLabel.bottomAnchor).isActive = true
        goalPieChart.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        goalPieChart.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        goalPieChart.heightAnchor.constraint(equalTo: goalPieChart.widthAnchor).isActive = true
        
        leadersChart.translatesAutoresizingMaskIntoConstraints = false
        leadersChart.topAnchor.constraint(equalTo: goalPieChart.bottomAnchor).isActive = true
        leadersChart.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        leadersChart.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        leadersChart.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    func displayJoinButton() {
        
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        joinButton.topAnchor.constraint(equalTo: leadersChart.bottomAnchor).isActive = true
        joinButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        joinButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        joinButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        joinButton.setTitle("Join Challenge", for: .normal)
        joinButton.isHidden = false
    }
}