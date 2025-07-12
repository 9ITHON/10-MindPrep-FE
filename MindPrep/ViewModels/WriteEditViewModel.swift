//
//  WriteEditViewModel.swift
//  MindPrep
//
//  Created by 어재선 on 7/13/25.
//

import Foundation

class WriteEditViewModel: ObservableObject {
    @Published var isShowSheet: Bool
    @Published private var isChooseEmotion: Bool
    @Published private var emotionIconNumber: Int
    @Published var emotionText: String
    @Published private var keywords: [String] = []
    init(
        isShowSheet: Bool = false,
        isChooseEmotion: Bool = false,
        emotionIconNumber: Int = 0,
        emotionText: String = ""
    ) {
        self.isShowSheet = isShowSheet
        self.isChooseEmotion = isChooseEmotion
        self.emotionIconNumber = emotionIconNumber
        self.emotionText = emotionText
    }

    
    func getIsChooseEmotion() -> Bool {
        return self.isChooseEmotion
    }
    

    func setChooseEmotion(_ bool: Bool) {
        self.isChooseEmotion = bool
    }
    func setEmotionIconNumber(_ number: Int) {
        self.emotionIconNumber = number
    }
    func getEmotionIconNumber() -> Int {
        return self.emotionIconNumber
    }
}
