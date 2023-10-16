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

func getCurrentISO8601Date() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    dateFormatter.timeZone = TimeZone.current
    
    let iso8601Date = dateFormatter.string(from: Date())
    return iso8601Date
}
