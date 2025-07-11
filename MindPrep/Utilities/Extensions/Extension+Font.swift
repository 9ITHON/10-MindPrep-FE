//
//  Extension+Font.swift
//  MindPrep
//
//  Created by 어재선 on 7/11/25.
//

import Foundation
import SwiftUI

extension Font {
    static func suit(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let familyName = "SUIT"
        var weightString: String
        
        switch weight {
        case .ultraLight:
            weightString = "ExtraLight"
        case .thin:
            weightString = "Thin"
        case .light:
            weightString = "Light"
        case .regular:
            weightString = "Regular"
        case .medium:
            weightString = "Medium"
        case .semibold:
            weightString = "Bold"
        case .bold:
            weightString = "ExtraBold"
        case .heavy:
            weightString = "Heavy"
        default:
            weightString = "Regular"
        }
        
        return Font.custom("\(familyName)-\(weightString)", size: size)
    }
}
