//
//  Extension+TextEditor.swift
//  MindPrep
//
//  Created by 어재선 on 7/12/25.
//

import Foundation
import SwiftUI

struct CustomTextEditorStyle: ViewModifier {
    
    let placeholder: String
    @Binding var text: String
    
    func body(content: Content) -> some View {
            content
                .padding(15)
                .background(alignment: .topLeading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .lineSpacing(15)
                            .padding(20)
                            .padding(.top, 2)
                            .font(.suit(size: 14,weight: .medium))
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                }
                .textInputAutocapitalization(.none) // 첫 시작 대문자 막기
                .autocorrectionDisabled()
                .background(Color(UIColor.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .scrollContentBackground(.hidden)
                .font(.suit(size: 14,weight: .medium))
                .overlay(alignment: .bottomTrailing) {
                    Text("\(text.count) / 1000")
                        .font(.system(size: 12))
                        .foregroundColor(Color(UIColor.systemGray2))
                        .padding(.trailing, 15)
                        .padding(.bottom, 15)
                        .onChange(of: text) { newValue in
                            if newValue.count > 1000 {
                                text = String(newValue.prefix(1000))
                            }
                        }
                }
    }
}

extension TextEditor {
    func customStyleEditor(placeholder: String, userInput: Binding<String>) -> some View {
        self.modifier(CustomTextEditorStyle(placeholder: placeholder, text: userInput))
    }
}
