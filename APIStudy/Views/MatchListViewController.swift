//
//  DetailViewController.swift
//  APIStudy
//
//  Created by John Yun on 6/18/24.
//

import UIKit

class MatchListViewController: UITableViewController {
    var teamId: String?
    let viewModel = MatchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableViewCell()
        configureViewModel()
        if let teamId = teamId {
            viewModel.fetchMatches(teamId: teamId)
        }
    }
    
    private func configureTableViewCell() {
        tableView.register(MatchTableViewCell.self, forCellReuseIdentifier: MatchTableViewCell.identifier)
    }
    
    private func configureViewModel() {
        viewModel.didUpdateMatches = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matches.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchTableViewCell.identifier, for: indexPath) as? MatchTableViewCell else {
            return UITableViewCell()
        }
        let match = viewModel.matches[indexPath.row]
        cell.configure(with: match)
        cell.selectionStyle = .none
        return cell
    }
}
