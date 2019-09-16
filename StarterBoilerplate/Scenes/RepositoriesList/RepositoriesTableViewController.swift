//
//  RepositoriesTableViewController.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "RepositoryCell"

final class RepositoriesTableViewController: UITableViewController, StoryboardInstantiatable {
    
    // MARK: StoryboardLoadable
    static var defaultStoryboardName = Constants.Storyboard.main
    
    static var instantiateType: StoryboardInstantiateType {
         return .initial
     }
    
    // MARK: Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    private var viewModel: RepositoryTableViewModel = RepositoryTableViewModel()
    private var term: String = "Swift"

    init(term: String, viewModel: RepositoryTableViewModel) {
        self.term = term
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(style: UITableView.Style.plain)
    }
    
    deinit {
        print("RepositoriesTableViewController deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchRepositories(term: term)
    }
}

//MARK: Setup ViewController

extension RepositoriesTableViewController {
    private func setupViewModel() {
         viewModel.changeHandler = { [unowned self] change in
             self.viewModelStateChanged(change: change)
         }
     }
        
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RepositoryCell")
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
    }
}

//MARK: RepositoryViewState

extension RepositoriesTableViewController {
    private func viewModelStateChanged(change: RepositoryViewState.Change) {
        switch change {
        case .error(let message):
            guard let message = message else {
                return
            }
            
            presentAlertWithTitle(message: message, options: Constants.String.ok) { [weak self] (action) in
                guard let self = self else { return }
                switch(action) {
                case 0:
                    self.navigationController?.popViewController(animated: true)
                default:
                    break
                }
            }
            
            break
        case .items:
            tableView.reloadData()
            break
        case .fetchStateChanged(let isFetching):
            activityIndicator?.isHidden = !isFetching
            break
        }
    }

}


//MARK: UITableViewDataSource
extension RepositoriesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let repository = viewModel.itemAtIndex(indexPath.row)
        cell.textLabel?.text = repository?.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.itemAtIndex(indexPath.row)
        let viewController = RepositoriesDetailBuilder.make(with: item!)
        show(viewController, sender: nil)
    }
}
