//
//  TCA_TabView_ProjectApp.swift
//  TCA_TabView_Project
//
//  Created by Luciano Puzer on 14/03/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_TabView_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                    initialState: AppState(
                        cards: [
                            CardView(
                                id: UUID(),
                                title: "square",
                                backColor: "yellow"
                            ),
                            CardView(
                                id: UUID(),
                                title: "square",
                                backColor: "pink"
                            ),
                            CardView(
                                id: UUID(),
                                title: "square",
                                backColor: "blue"
                            )
                        ]
                    ),
                    reducer: appReducer,
                    environment: AppEnvironment()
                )
            )
        }
    }
}
