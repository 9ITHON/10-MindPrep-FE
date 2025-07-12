//
//  ContentView.swift
//  MindPrep
//
//  Created by 어재선 on 7/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var pathModel = PathModel()
    @StateObject private var writeViewModel = WriteEditViewModel()
    var body: some View {
        NavigationStack(path: $pathModel.paths) {
            WriteEditView()
                .environmentObject(writeViewModel)
                .navigationDestination(for: PathType.self, destination: { pathType in
                    switch pathType {
                    case .writeEditView(_):
                        WriteEditView()
                            .navigationBarBackButtonHidden()
                            .environmentObject(writeViewModel)
                    
                    case .homeView:
                        HomeView()
                    }
                    
                    
                })
        }
        .environmentObject(pathModel)
    }
}

#Preview {
    ContentView()
}
