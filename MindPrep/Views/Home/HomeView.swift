//
//  HomeView.swift
//  MindPrep
//
//  Created by 어재선 on 7/12/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill()
                    .foregroundStyle(Color(.primary))
                    .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                    .shadow(radius: 10)
                    .ignoresSafeArea()
                VStack{
                    CustomNavigationBar(isDisplayLeftBtn: false)
                    MainBannerView()
                    Spacer()
                }
            }
            .frame(height: 280)
                    
            //TODO: CalendarView 추가
            CalendarView()
            Spacer()
        }
       
        
        
    }
}

//MARK: - MainBannerView
private struct MainBannerView: View {
    fileprivate var body: some View {
        VStack {
            ZStack{
                HStack {
                    Spacer()
                    Image("bannericon")
                }
                .padding(.horizontal, 10)
                HStack() {
                    VStack(alignment: .leading) {
                        Text("띠우니님, 오늘도 마을을 살피셧나요?")
                            .font(.suit(size: 24, weight: .bold))
                        let markdonw = try! AttributedString(markdown: "**마음채비** 에서 감정을 기록하고, 작은수미표를 준비해보세요.")
                        Text(markdonw)
                            .font(.suit(size: 15,weight: .regular))
                            TodayKeywordView()
                    }
                    Spacer()
                        .frame(width: 100)
                }
            }
        }
        .padding(.bottom, 10)
       
    }
}

//MARK: - TodayKeywordView
private struct TodayKeywordView: View {
    fileprivate var body: some View {
        VStack(alignment: .leading) {
            Text("오늘의 추천 키워드")
                .font(.suit(size: 13, weight: .medium))
            HStack {
                ForEach(0..<3) { _ in
                    Text("#마음챙김")
                        .font(.suit(size: 13, weight: .regular))
                        .cornerRadius(100)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .foregroundStyle(.white)
                        .background(Color(.sub1))
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                }
    
            }
        }
    }
}

//MARK: - CalendarView
private struct CalendarView: View {
    fileprivate var body: some View {
        VStack{
            HStack{
                Text("오늘의감정을 기록해보세요.")
                    .font(.suit(size: 20,weight: .bold))
                Spacer()
            }
            ZStack{
                Rectangle()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    
                DatePicker("",selection: .constant(Date()),displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding(.top, -40)
            }
        }
        .padding(12)
        
    }
    
}

#Preview {
    HomeView()
}
