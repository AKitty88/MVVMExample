//
//  ViewController.swift
//  MVVMExample
//
//  Created by User on 21/6/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, PersonFollowingTableViewCellDelegate {
    private var models = [Person]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(
            PersonFollowingTableViewCell.self,
            forCellReuseIdentifier: PersonFollowingTableViewCell.identifier
        )
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        let names = [
        "Joe", "Dan", "Jeff", "Jenny", "Emily"
        ]
        
        for name in names {
            models.append(Person(name: name))
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PersonFollowingTableViewCell.identifier,
            for: indexPath
        ) as? PersonFollowingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: PersonViewModel(with: model))
        cell.tag = indexPath.row + 100
        cell.delegate = self
        return cell
    }
    
    func followButtonIsTapped(onCell cell: PersonFollowingTableViewCell, withviewModel viewModel: PersonViewModel) {
        let index = cell.tag - 100
        
        models[index].name = viewModel.name
        models[index].userName = viewModel.userName
        models[index].isFollowing = viewModel.isFollowing
        
    }
    
}








