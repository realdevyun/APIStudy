//
//  TeamTableViewCell.swift
//  APIStudy
//
//  Created by John Yun on 6/19/24.
//

import UIKit
import Kingfisher

class TeamTableViewCell: UITableViewCell {
    static let identifier = "TeamCell"

    private let teamBadgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(teamBadgeImageView)
        contentView.addSubview(teamNameLabel)
        
        NSLayoutConstraint.activate([
            teamBadgeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            teamBadgeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamBadgeImageView.widthAnchor.constraint(equalToConstant: 40),
            teamBadgeImageView.heightAnchor.constraint(equalToConstant: 40),
            
            teamNameLabel.leadingAnchor.constraint(equalTo: teamBadgeImageView.trailingAnchor, constant: 10),
            teamNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            teamNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with team: Team) {
        teamNameLabel.text = team.strTeamKorean
        if let badgeUrl = team.strBadge, let url = URL(string: badgeUrl) {
            teamBadgeImageView.kf.setImage(with: url)
        }
    }
}
