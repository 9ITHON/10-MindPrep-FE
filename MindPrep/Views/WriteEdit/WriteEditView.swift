//
//  WriteEditView.swift
//  MindPrep
//
//  Created by 어재선 on 7/12/25.
//

import SwiftUI

struct WriteEditView: View {
    @EnvironmentObject var writeEditViewModel: WriteEditViewModel
    private let emotion = EmotionModel()
    var body: some View {
        ScrollView {
            CustomNavigationBar(
                isDisplayRightBtn:true,
                isMainTitle: false,
                
                rightBtnType: .bookmark,
                title: "2025년 8월 10일"
            )
            EmojiButtonView()
            ContentTextFieldTitleView()
            ContentTextFieldView()
            KeywordTitleVeiw()
            KeywordView(imageName: "emoji-01", title: "기본",emotions: emotion.defaultEmotion)
            KeywordView(imageName: "emoji-05", title: "행복",emotions: emotion.happinessEmotion)
            KeywordView(imageName: "emoji-16", title: "슬품", emotions: emotion.sadEmotion)
            KeywordView(imageName: "emoji-12", title: "분노", emotions: emotion.angerEmotion)
            KeywordView(imageName: "emoji-06", title: "두려움", emotions: emotion.aweEmotion)
            KeywordView(imageName: "emoji-13", title: "기타", emotions: emotion.etcEmotion)
            WriteEditButton()
            
        }
        .sheet(isPresented: $writeEditViewModel.isShowSheet) {
            EmojiChooseSheetView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium])
        }
        .onTapGesture {
            self.endTextEditing()
        }
    }
}
// MARK: - EmojiButtonView
private struct EmojiButtonView: View {
    @EnvironmentObject var writeEditViewModel: WriteEditViewModel
    fileprivate var body: some View {
        Button(action: {
            writeEditViewModel.isShowSheet.toggle()
        }, label: {
            if !writeEditViewModel.getIsChooseEmotion(){
                VStack {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10)
                        .padding(4)
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .foregroundStyle(.white)
                            
                        }
                        .drawingGroup()
                        .shadow(radius: 5)
                        .offset(x: 32, y: 13)
                    
                    Circle()
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [3]))
                        .frame(width: 65, height: 65)
                }
                .scaledToFit()
            } else {
                VStack {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10)
                        .padding(4)
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .foregroundStyle(.white)
                            
                        }
                        .drawingGroup()
                        .shadow(radius: 5)
                        .offset(x: 32, y: 13)
                    
                    Image(writeEditViewModel.getEmotionIconNumber() < 10 ? "emoji-0\(writeEditViewModel.getEmotionIconNumber())" : "emoji-\(writeEditViewModel.getEmotionIconNumber())")
                        .resizable()
                        .frame(width: 65, height: 65)
                }
                .scaledToFit()
                
                
            }
            
        })
    }
}
// MARK: - ContentTextFieldTitleView
private struct ContentTextFieldTitleView: View {
    fileprivate var body: some View {
        VStack{
            HStack {
                Text("오늘 어떤 하루를 보냈나요?")
                    .font(
                        .suit(size: 20,weight: .bold))
                Spacer()
            }
            HStack{
                Text("감정을 느낀 상황들과 느꼈던 감정을 솔직하게 말해주세요.")
                    .font(
                        .suit(size: 14, weight: .medium))
                    .foregroundStyle(.gray)
                Spacer()
            }
            
        }
        .padding(.horizontal, 16)
    }
}
// MARK: - ContentTextFieldView
private struct ContentTextFieldView: View {
    @EnvironmentObject private var writeEditViewModel: WriteEditViewModel
    private let placeholder: String = "내용을 입력해주세요."
    
    var body: some View {
        VStack {
            TextEditor(text: $writeEditViewModel.emotionText)
                .customStyleEditor(placeholder: placeholder, userInput: $writeEditViewModel.emotionText)
                .frame(height: 280)
                .padding()
        }
    }
}

//MARK: - KeywordTitleVeiw
private struct KeywordTitleVeiw: View {
    fileprivate var body: some View {
        VStack{
            HStack{
                Text("감정 키워드")
                    .font(.suit(size: 20, weight: .bold))
                Spacer()
            }
            HStack{
                Text("감정을 솔직하게 나타낼 수 있는 단어를 선택해 주세요.")
                    .font(
                        .suit(size: 14, weight: .medium))
                    .foregroundStyle(.gray)
                Spacer()
            }
        } .padding(.horizontal, 16)
    }
}

//MARK: - KeywordView
private struct KeywordView: View {
    private let emotions: [String]
    private let imageName: String
    private let title: String
    
    @State private var isToggle: Bool = false
    init(imageName: String, title: String, emotions: [String], ) {
        self.imageName = imageName
        self.title = title
        self.emotions = emotions
    }
    fileprivate var body: some View {
        VStack {
            HStack{
                Image(imageName)
                    .resizable()
                    .frame(width: 35,height: 35)
                Text(title)
                    .font(.suit(size: 18, weight: .bold))
                Spacer()
                
                Button(action: {
                    
                    isToggle.toggle()
                    
                },label: {
                    if isToggle {
                        Image(systemName:"chevron.up")
                            .foregroundStyle(.gray)
                    } else {
                        Image(systemName:"chevron.down")
                            .foregroundStyle(.gray)
                    }
                    
                })
            }
            if isToggle {
                let columns: [GridItem] = [
                    GridItem(.adaptive(minimum: 90), spacing:10)
                ]
                LazyVGrid(columns:columns,alignment: .leading){
                    ForEach(emotions, id: \.self) { emotion in
                        KeywordCellView(text: emotion)
                            .padding(.top, 5)
                    }
                }
                
            }
            Divider()
                .padding(.top,3)
            
        }
        .padding(.horizontal,16)
    }
}

// MARK: - KeywordCellView
private struct KeywordCellView: View {
    
    
    @State private var isSelected: Bool = false
    private var text: String
    init(text: String) {
        self.text = text
    }
    
    fileprivate var body: some View {
        VStack{
            if !isSelected {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                    
                        .stroke(Color.gray, lineWidth: 2)
                    Text(text)
                        .font(.suit(size: 14,weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.vertical,4)
                        .padding(.horizontal)
                }
                .fixedSize()
            } else {
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color.sub1)
                    Text(text)
                        .font(.suit(size: 14,weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical,4)
                        .padding(.horizontal)
                }
                .fixedSize()
            }
        }
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

//MARK: - WriteEditButton
private struct WriteEditButton: View {
    @State private var isWriteEdit: Bool = true
    fileprivate var body: some View {
        Button(
            action: {
                
            },
            label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.gray.opacity(0.3))
                    VStack{
                        Text(isWriteEdit ? "저장하기" : "수정하기")
                            .font(.suit(size: 16, weight: .medium))
                            .foregroundStyle(.black)
                            .padding()
                    }
                    
                    
                }
            })
        .padding(.horizontal, 16)
    }
}

//MARK: - EmojiChooseSheetView
private struct EmojiChooseSheetView: View {
    @EnvironmentObject private var writeEditViewModel: WriteEditViewModel
    fileprivate var body: some View {
        VStack{
            EmojiChooseTitleView()
            let columns: [GridItem] = [
                GridItem(.adaptive(minimum: 80), spacing:10)
            ]
            LazyVGrid(columns:columns,alignment: .center){
                ForEach(1..<17) { num in
                    EmojiChooseButtonCellView(emotionIconNumber: num)
                        .onTapGesture {
                            writeEditViewModel.setChooseEmotion(true)
                            writeEditViewModel.setEmotionIconNumber(num)
                            writeEditViewModel.isShowSheet = false
                        }
                    
                }
            }
        }
    }
}
//MARK: - EmojiChooseTitleView
private struct EmojiChooseTitleView: View {
    fileprivate var body: some View {
        VStack{
            HStack {
                Text("오늘 어떤 하루를 보냈나요?")
                    .font(
                        .suit(size: 20,weight: .bold))
                Spacer()
            }
            HStack{
                Text("감정을 느낀 상황들과 느꼈던 감정을 솔직하게 말해주세요.")
                    .font(
                        .suit(size: 14, weight: .medium))
                    .foregroundStyle(.gray)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
    }
}

private struct EmojiChooseButtonCellView:View {
    private let emotionIconNumber: Int
    init(emotionIconNumber: Int) {
        self.emotionIconNumber = emotionIconNumber
    }
    fileprivate var body: some View {
        Image(emotionIconNumber < 10 ? "emoji-0\(emotionIconNumber)" : "emoji-\(emotionIconNumber)")
            .resizable()
            .frame(width: 70, height: 70)
        
    }
}
#Preview {
    WriteEditView()
        .environmentObject(WriteEditViewModel())
}
