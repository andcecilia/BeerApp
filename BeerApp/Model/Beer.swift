//
//  Beer.swift
//  BeerApp
//
//  Created by Cecilia Andrea Pesce on 22/05/22.
//

import Foundation
import UIKit

struct Beer: Codable {
    let imageUrl: String
    let name: String
    let abv: Double
    let tagline: String
    let ibu: Double
    let description: String
    let id: Int

    private enum CodingKeys: String, CodingKey {
    case imageUrl = "image_url"
    case name,
         abv,
         tagline,
         ibu,
         description,
         id
    }
}
