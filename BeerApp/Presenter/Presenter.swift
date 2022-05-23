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

typealias PresenterDelegate = BeerPresenterDelegate //UIViewController

class BeerPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getBeers(){
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                return
            }
            do {
                let result = try? JSONSerialization.jsonObject(with: data) //options: .allowFragments) as? [AnyHashable: Any?]
                //let beers = result?.toBeers()
                debugPrint(result)
            }
            catch {
                debugPrint(error)
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}

extension Data {
    func toBeer() -> Beer? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Beer.self, from: self)
    }
}

extension Collection {
    func toBeer() -> Beer? {
        guard let beer = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted).toBeer() else {return nil}
        return beer
    }
    func toBeers() -> [Beer]? {
        var result = [Beer]()
        for item in self {
            guard let beer = try? JSONSerialization.data(withJSONObject: item, options: .prettyPrinted).toBeer() else {continue}
            result.append(beer)
        }
        return result
    }
}
