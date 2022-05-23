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
        
        //Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getBeers()
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
        let cell: BeerItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BeerItemCell", for: indexPath) as! BeerItemTableViewCell
        //cell.configure(url: <#T##URL?#>, beerName: <#T##String?#>, beerAlcoholContent: <#T##String?#>)
        
        return cell
}
    
    func presentBeers(beers:[Beer]){
    self.beers = beers
    DispatchQueue.main.async {
        self.tableView.reloadData()
    }
}
}

