//
//  Utils.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 08/10/2023.
//

import Foundation



    func getDocumentsDirectory () -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    
}
