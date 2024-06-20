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
        tableView.register(MatchTableViewCell.self, forCellReuseIdentifier: MatchTableViewCell.identifier)

        viewModel.didUpdateMatches = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        if let teamId = teamId {
            viewModel.fetchMatches(teamId: teamId)
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
