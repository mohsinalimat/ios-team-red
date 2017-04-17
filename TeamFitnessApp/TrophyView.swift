//
//  TrophyView.swift
//  TeamFitnessApp
//
//  Created by Alessandro Musto on 4/13/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class TrophyView: FitnessView {


  var user: User! {
    didSet {
      participationCountLabel.text = "\(user.oldChallengeIDs.count)"
      if let firstCount = user.trophies["gold"] {
        firstPlaceLabel.text = "\(firstCount)"
      }
      if let secondCount = user.trophies["silver"] {
        secondPlaceLabel.text = "\(secondCount)"
      }
      if let thirdCount = user.trophies["bronze"] {
        thirdPlaceLabel.text = "\(thirdCount)"
      }
    }
  }

  
  var participationLabel: FitnessLabel!
  var participationCountLabel: CountLabel!
  var completionLabel: FitnessLabel!
  var completionCountLabel: CountLabel!
  var trophyLabel: FitnessLabel!
  var firstPlaceImageView: UIImageView!
  var firstPlaceLabel: CountLabel!
  var secondPlaceImageView: UIImageView!
  var secondPlaceLabel: CountLabel!
  var thirdPlaceImageView: UIImageView!
  var thirdPlaceLabel: CountLabel!
  var archeiveLabel: FitnessLabel!
  var tableView: UITableView!



  override init(frame: CGRect) {
    super.init(frame: frame)
    comInit()
    setConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    comInit()
    setConstraints()
  }

  func comInit() {



    participationLabel = FitnessLabel(frame: CGRect.zero)
    participationLabel.text = "Challenege Participation Count"

    completionLabel = FitnessLabel(frame: CGRect.zero)
    completionLabel.text = "Successful Completion Count"

    trophyLabel = FitnessLabel(frame: CGRect.zero)
    trophyLabel.text = "Tropies"


    participationCountLabel = CountLabel()
    completionCountLabel = CountLabel()
    firstPlaceLabel = CountLabel()
    secondPlaceLabel = CountLabel()
    thirdPlaceLabel = CountLabel()

    firstPlaceImageView = UIImageView(image: #imageLiteral(resourceName: "gold"))
    secondPlaceImageView = UIImageView(image: #imageLiteral(resourceName: "silver"))
    thirdPlaceImageView = UIImageView(image: #imageLiteral(resourceName: "bronze"))

    archeiveLabel = FitnessLabel(frame: CGRect.zero)
    archeiveLabel.text = "Challenge Archieve"

    tableView = UITableView()
    tableView.backgroundColor = UIColor.clear
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    let views: [UIView] = [participationLabel, participationCountLabel, completionLabel, completionCountLabel, trophyLabel, firstPlaceImageView, firstPlaceLabel, secondPlaceImageView, secondPlaceLabel, thirdPlaceImageView, thirdPlaceLabel, archeiveLabel, tableView]

    for view in views {
      view.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview(view)
    }
  }


  func setConstraints() {
    participationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 75).isActive = true
    participationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    participationLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true


    participationCountLabel.topAnchor.constraint(equalTo: participationLabel.bottomAnchor, constant: 5).isActive = true
    participationCountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    participationCountLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
    participationCountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

    completionLabel.topAnchor.constraint(equalTo: participationCountLabel.bottomAnchor, constant: 10).isActive = true
    completionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    completionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true


    completionCountLabel.topAnchor.constraint(equalTo: completionLabel.bottomAnchor, constant: 5).isActive = true
    completionCountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    completionCountLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
    completionCountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

    trophyLabel.topAnchor.constraint(equalTo: completionCountLabel.bottomAnchor, constant: 20).isActive = true
    trophyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    trophyLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true


    firstPlaceImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    firstPlaceImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    firstPlaceImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -120).isActive = true
    firstPlaceImageView.topAnchor.constraint(equalTo: trophyLabel.bottomAnchor, constant: 10).isActive = true

    firstPlaceLabel.topAnchor.constraint(equalTo: trophyLabel.bottomAnchor, constant: 20).isActive = true
    firstPlaceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    firstPlaceLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
    firstPlaceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

    secondPlaceImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    secondPlaceImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    secondPlaceImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -120).isActive = true
    secondPlaceImageView.topAnchor.constraint(equalTo: firstPlaceImageView.bottomAnchor, constant: 10).isActive = true

    secondPlaceLabel.topAnchor.constraint(equalTo: firstPlaceImageView.bottomAnchor, constant: 20).isActive = true
    secondPlaceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    secondPlaceLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
    secondPlaceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

    thirdPlaceImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    thirdPlaceImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    thirdPlaceImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -120).isActive = true
    thirdPlaceImageView.topAnchor.constraint(equalTo: secondPlaceImageView.bottomAnchor, constant: 10).isActive = true

    thirdPlaceLabel.topAnchor.constraint(equalTo: secondPlaceImageView.bottomAnchor, constant: 20).isActive = true
    thirdPlaceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    thirdPlaceLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
    thirdPlaceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

    archeiveLabel.topAnchor.constraint(equalTo: thirdPlaceImageView.bottomAnchor, constant: 20).isActive = true
    archeiveLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    archeiveLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true

    tableView.topAnchor.constraint(equalTo: archeiveLabel.bottomAnchor, constant: 10).isActive = true
    tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    tableView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
    tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
  }



}