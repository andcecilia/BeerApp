//
//  BeerListViewController.swift
//  BeerApp
//
//  Created by Cecilia Andrea Pesce on 03/05/22.
//

import UIKit

class BeerListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
        
    private var beers = [Beer]()
    private let presenter = BeerPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beers"
        
        // Table
        tableView.delegate = self
        tableView.dataSource = self
        
        //Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getBeers()
    }
}

extension BeerListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("botão")
        return beers.count
}
}

extension BeerListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return 3
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = beers[indexPath.row].name
        
        return cell
}
    
    func presentBeers(beers:[Beer]{
    self.users = users
    DispatchQueue.main.async {
        self.tableView.reloadData()
    }
}
}

