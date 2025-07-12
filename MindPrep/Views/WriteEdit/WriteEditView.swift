//
//  WriteEditView.swift
//  MindPrep
//
//  Created by 어재선 on 7/12/25.
//

import SwiftUI

struct WriteEditView: View {
    var body: some View {
        // TODO: - 이모지 추가 뷰
        emojiButtonView()
        // TODO: - 작성 뷰
        // TODO: - 키워드 뷰
    }
}

private struct emojiButtonView: View {
    fileprivate var body: some View {
        
        Button(action: {}, label: {
            VStack {
                    Image(systemName: "plus.circle")
                    .foregroundStyle(.black)
                    .drawingGroup()
                    .shadow(radius: 5)
                    .offset(x: 30, y: 9)
                
                Circle()
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [3]))
                    .frame(width: 65, height: 65)
                
            }
            .scaledToFit()
            
        })
        
    }
}

#Preview {
    WriteEditView()
}
