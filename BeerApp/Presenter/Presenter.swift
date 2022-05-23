//
//  BeerListAPI.swift
//  BeerApp
//
//  Created by Cecilia Andrea Pesce on 22/05/22.
//

//arquivo que fará a chamada com a API

import Foundation
import UIKit

protocol BeerPresenterDelegate: AnyObject {
    func presentBeers(beers: [Beer])
}

typealias PresenterDelegate = BeerPresenterDelegate & UIViewController

class BeerPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getBeers(){
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let beers = try JSONDecoder().decode([Beer].self, from: data)
                self?.delegate?.presentBeers(beers: beers)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
