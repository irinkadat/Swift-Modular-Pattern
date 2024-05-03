//
//  CatFactsViewController.swift
//  Swift Modular Pattern
//
//  Created by Irinka Datoshvili on 03.05.24.
//

import UIKit
import TinyConstraints

class CatFactsViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel = CatFactsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchCatFacts()
    }
    
    private func setupUI() {
        title = "Cat Facts 😻"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        configureNavTitle()
        
        view.backgroundColor = UIColor(red: 1.0, green: 138/255, blue: 112/255, alpha: 1.0)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 1.0, green: 138/255, blue: 112/255, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CatFactsCell.self, forCellReuseIdentifier: "CatFactCell")
        
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
    
    func configureNavTitle() {
        if let customFont = UIFont(name: "SpaceGrotesk-Bold", size: 24) {
            let attrs: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: customFont
            ]
            navigationController?.navigationBar.largeTitleTextAttributes = attrs
        }
    }
    
    private func bindViewModel() {
        viewModel.onDataUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension CatFactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.catFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatFactCell", for: indexPath) as! CatFactsCell
        let catFact = viewModel.catFacts[indexPath.row]
        cell.titleLabel.text = catFact.fact
        return cell
    }
}

extension CatFactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
