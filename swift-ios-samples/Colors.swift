//
//  Colors.swift
//  

import Foundation

/// struct holding constants for colors used in the app
struct Color {
    
    private init() {} // prevents initialization of the struct
    
    static let catsBlue = UIColor(red: 23/255.0, green: 90/255.0, blue: 175/255.0, alpha: 1)
    static let standardBackground = UIColor(red: 247/256.0, green: 247/256.0, blue: 247/256.0, alpha: 1)
    static let standardBorder = UIColor(red: 218/255.0, green: 223/255.0, blue: 245/255.0, alpha: 1).cgColor
    static let easyBlack = UIColor(red: 80/255.0, green: 80/255.0, blue: 80/255.0, alpha: 1)
    static let niceGreen = UIColor(red: 184/255.0, green: 232/255.0, blue: 134/255.0, alpha: 1)
    static let winGreen = UIColor(red: 211/255.0, green: 241/255.0, blue: 205/255.0, alpha: 1)
    static let loseRed = UIColor(red: 255/255.0, green: 195/255.0, blue: 180/255.0, alpha: 1)
    static let warningYellow = UIColor(red: 255/255.0, green: 239/255.0, blue: 190/255.0, alpha: 1)
}
