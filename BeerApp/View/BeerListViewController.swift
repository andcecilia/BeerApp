//
//  BeerListViewController.swift
//  BeerApp
//
//  Created by Cecilia Andrea Pesce on 03/05/22.
//

import UIKit

class BeerListViewController: UIViewController, BeerPresenterDelegate {

    @IBOutlet var tableView: UITableView!
        
    private var beers = [Beer]()
    private let presenter = BeerPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beers"
        
        // Table
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BeerItemTableViewCell.self)
        
        loadBeers()
        //Presenter
        presenter.setViewDelegate(delegate: self)
        
    }
    func loadBeers() {
        presenter.getBeers() { (response, result) in
            switch result {
            case true:
                if let items = response {
                    self.beers.append(contentsOf: items)
                    self.tableView.reloadData()
                }
            case false: //break
                if let items = response {
                    self.beers.append(contentsOf: items)
                    self.tableView.reloadData()
                }
            }
            
        }
    }
}

extension BeerListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("botão")
}
}

extension BeerListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return beers.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as BeerItemTableViewCell
       
        cell.configure(url: beers[indexPath.row].imageUrl,
                       beerName: beers[indexPath.row].name,
                       beerAlcoholContent: String(beers[indexPath.row].abv))
            
        return cell
}
    
    func presentBeers(beers:[Beer]){
    self.beers = beers
    DispatchQueue.main.async {
        self.tableView.reloadData()
    }
}
}

