//
//  BeerListAPI.swift
//  BeerApp
//
//  Created by Cecilia Andrea Pesce on 22/05/22.
//

//arquivo que fará a chamada com a API

import Foundation
import UIKit
import Alamofire

protocol BeerPresenterDelegate: AnyObject {
    func presentBeers(beers: [Beer])
}

struct DataType {
    typealias JSON = [AnyHashable: Any?]
}
typealias PresenterDelegate = BeerPresenterDelegate //UIViewController

class BeerPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getBeers(_ completion: @escaping (_ response: [Beer]?, _ sucess: Bool) -> Void) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else {return}
        AF.request(url, method: .get, parameters: nil).validate().responseJSON { response in
            let result = try? JSONSerialization.jsonObject(with: response.data ?? Data(), options: .allowFragments) as? [DataType.JSON]
            let beers = result?.toBeers()
            completion(beers, (response.error != nil))
        }
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
