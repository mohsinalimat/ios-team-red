//
//  TeamDetailView.swift
//  TeamFitnessApp
//

//  Created by Alessandro Musto on 4/19/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class TeamDetailView: FitnessView {


    var captainLabel: FitnessLabel!
    var membersLabel: TitleLabel!
    var challengesLabel: TitleLabel!
    var inviteMembersButton: FitnessButton!
    var createChallengeButton: FitnessButton!
    var membersView: UITableView!
    var challengesView: UITableView!
    var joinButton: FitnessButton!
    var teamImageView: UIImageView!

    var reportButton: FitnessButton!

    var leaveTeamButton: FitnessButton!




    override init(frame: CGRect) {
        super.init(frame: frame)
        comInit()
        setConstrains()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        comInit()
        setConstrains()
    }

    func comInit() {


        teamImageView = UIImageView()
        self.addSubview(teamImageView)
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.layer.cornerRadius = 10
        teamImageView.layer.masksToBounds = true
        teamImageView.backgroundColor = UIColor.clear


        reportButton = FitnessButton()
        self.addSubview(reportButton)
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.setReversed(text: "Report Image")
        reportButton.reverseColors()

        leaveTeamButton = FitnessButton()
        self.addSubview(leaveTeamButton)
        leaveTeamButton.translatesAutoresizingMaskIntoConstraints = false

        leaveTeamButton.set(text: "leave")


        captainLabel = FitnessLabel()
        self.addSubview(captainLabel)
        captainLabel.translatesAutoresizingMaskIntoConstraints = false
        captainLabel.textAlignment = .center
        captainLabel.changeFontSize(to: 20)
        captainLabel.reverseColors()

        joinButton = FitnessButton()
        self.addSubview(joinButton)
        joinButton.set(text: "join")
        joinButton.translatesAutoresizingMaskIntoConstraints = false

        membersLabel = TitleLabel()
        membersLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(membersLabel)
        membersLabel.textAlignment = .center
        membersLabel.reverseColors()
        membersLabel.set(text: "team members")
        membersLabel.changeFontSize(to: 20)


        membersView = UITableView()
        self.addSubview(membersView)
        membersView.translatesAutoresizingMaskIntoConstraints = false
        membersView.backgroundColor = UIColor.clear

        challengesLabel = TitleLabel()
        challengesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(challengesLabel)
        challengesLabel.textAlignment = .center
        challengesLabel.reverseColors()
        challengesLabel.set(text: "team challenges")
        challengesLabel.changeFontSize(to: 20)


        challengesView = UITableView()
        challengesView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(challengesView)
        challengesView.backgroundColor = UIColor.clear


        createChallengeButton = FitnessButton()
        createChallengeButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(createChallengeButton)
        createChallengeButton.translatesAutoresizingMaskIntoConstraints = false
        createChallengeButton.set(text: "create team challenge")

    }


    func setConstrains() {

        teamImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        teamImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 75).isActive = true
        teamImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.20).isActive = true
        teamImageView.heightAnchor.constraint(equalTo: teamImageView.widthAnchor).isActive = true

        reportButton.heightAnchor.constraint(equalTo: teamImageView.heightAnchor, multiplier: 0.15).isActive = true
        reportButton.bottomAnchor.constraint(equalTo: teamImageView.bottomAnchor).isActive = true
        reportButton.leftAnchor.constraint(equalTo: teamImageView.rightAnchor).isActive = true
        reportButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

        captainLabel.constrainVertically(belowView: teamImageView, widthMultiplier: 0.8, heightMultiplier: 0.05)

        joinButton.leftAnchor.constraint(equalTo: teamImageView.rightAnchor, constant: 20).isActive = true
        joinButton.topAnchor.constraint(equalTo: teamImageView.topAnchor).isActive = true
        joinButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        joinButton.heightAnchor.constraint(equalTo: joinButton.widthAnchor, multiplier: 0.4).isActive = true


        leaveTeamButton.centerYAnchor.constraint(equalTo: joinButton.centerYAnchor).isActive = true
        leaveTeamButton.centerXAnchor.constraint(equalTo: joinButton.centerXAnchor).isActive = true
        leaveTeamButton.heightAnchor.constraint(equalTo: joinButton.heightAnchor).isActive = true
        leaveTeamButton.widthAnchor.constraint(equalTo: joinButton.widthAnchor).isActive = true


        membersLabel.constrainVertically(belowView: captainLabel, widthMultiplier: 0.8, heightMultiplier: 0.05)

        membersView.constrainVertically(belowView: membersLabel, widthMultiplier: 0.8, heightMultiplier: 0.25)

        createChallengeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        createChallengeButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        createChallengeButton.topAnchor.constraint(equalTo: challengesView.bottomAnchor, constant: 6).isActive = true
        createChallengeButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true

        challengesLabel.constrainVertically(belowView: membersView, widthMultiplier: 0.8, heightMultiplier: 0.04)

        challengesView.constrainVertically(belowView: challengesLabel, widthMultiplier: 0.8, heightMultiplier: 0.10)
        
        
    }
}
