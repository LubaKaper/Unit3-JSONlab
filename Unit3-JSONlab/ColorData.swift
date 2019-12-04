//
//  ColorData.swift
//  Unit3-JSONlab
//
//  Created by Liubov Kaper  on 12/3/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import Foundation

struct ColorData: Codable {
    let colors: [Colors]
}


struct Colors: Codable {
    let name: Name
    let rgb: RGB
    let hex: Hex
}

struct Name: Codable {
    let value: String
}

struct RGB: Codable {
    let r: Int
    let g: Int
    let b: Int
    let value: String
    
}
struct Hex: Codable {
    let value: String
}

extension ColorData {
    static func getColors() -> [Colors] {
        var myColors = [Colors]()
        guard let fileURL = Bundle.main.url(forResource: "colors", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let colorData = try JSONDecoder().decode(ColorData.self, from: data)
            myColors = colorData.colors.sorted {$0.name.value < $1.name.value}
        } catch {
            fatalError("failed to load contents \(error)")
        }
        return myColors
    }
}
