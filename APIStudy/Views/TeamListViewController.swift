//
//  ViewController.swift
//  APIStudy
//
//  Created by John Yun on 6/18/24.
//

import UIKit

class TeamListViewController: UITableViewController {
    let viewModel = TeamViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        configureTableViewCell()
        configureViewModel()
        viewModel.fetchTeams()
        
    }
    
    private  func setUpUI() {
        self.title = "2024 K League 1"
    }
    
    private func configureTableViewCell() {
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.identifier)
    }
    
    private func configureViewModel() {
        viewModel.didUpdateTeams = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.teams.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.identifier, for: indexPath) as? TeamTableViewCell else {
            return UITableViewCell()
        }
        let team = viewModel.teams[indexPath.row]
        cell.configure(with: team)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = viewModel.teams[indexPath.row]
        let matchVC = MatchListViewController()
        matchVC.teamId = team.idTeam
        matchVC.title = "\(team.strTeamKorean ?? "") 최근 홈경기"
        navigationController?.pushViewController(matchVC, animated: true)
    }
}
