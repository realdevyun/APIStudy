//
//  MatchTableViewCell.swift
//  APIStudy
//
//  Created by John Yun on 6/20/24.
//

import UIKit
import Kingfisher

class MatchTableViewCell: UITableViewCell {
    static let identifier = "MatchCell"
    
    private let homeTeamBadgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let awayTeamBadgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(homeTeamBadgeImageView)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(awayTeamBadgeImageView)
        
        NSLayoutConstraint.activate([
            homeTeamBadgeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            homeTeamBadgeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            homeTeamBadgeImageView.widthAnchor.constraint(equalToConstant: 40),
            homeTeamBadgeImageView.heightAnchor.constraint(equalToConstant: 40),
            
            scoreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            awayTeamBadgeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            awayTeamBadgeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            awayTeamBadgeImageView.widthAnchor.constraint(equalToConstant: 40),
            awayTeamBadgeImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with match: Match) {
        scoreLabel.text = "\(match.intRound ?? "")R \(match.strHomeTeamKorean ?? "") \(match.intHomeScore ?? "") - \(match.intAwayScore ?? "") \(match.strAwayTeamKorean ?? "")"
        
        if let homeBadgeUrl = match.strHomeTeamBadge, let url = URL(string: homeBadgeUrl) {
            homeTeamBadgeImageView.kf.setImage(with: url)
        }
        
        if let awayBadgeUrl = match.strAwayTeamBadge, let url = URL(string: awayBadgeUrl) {
            awayTeamBadgeImageView.kf.setImage(with: url)
        }
    }
}
