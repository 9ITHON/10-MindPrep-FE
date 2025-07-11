//
//  Extension+Font.swift
//  MindPrep
//
//  Created by 어재선 on 7/11/25.
//

import Foundation
import UIKit

extension UIFont {
    static func SUIT(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = SUIT
        var weightString: String
        switch weight {
        
        case .bold:
            weightString = "Bold"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .heavy:
            weightString = "Heavy"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Regular"
        }
        return UIFont(name: "\(String(describing: familyName))-\(weightString)",size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
}
