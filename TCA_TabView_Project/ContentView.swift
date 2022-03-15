//
//  ContentView.swift
//  TCA_TabView_Project
//
//  Created by Luciano Puzer on 14/03/22.
//

import SwiftUI
import ComposableArchitecture


struct ContentView: View {
    let store: Store<AppState, AppAction>
    var body: some View {
        WithViewStore(self.store) { viewStore in
        VStack{
            TabView(selection:
                        viewStore.binding(
                            get: { $0.tabIndex },
                            send: { .tabIndexChange(index: $0) }
                        )
            ) {
                ForEach(Array(viewStore.cards.enumerated()), id:
                \.element.id) { index, todo in
                    VStack {
                    Image(systemName: todo.title)
                        .resizable()
                        .frame(width: 200, height: 100)
                        .background(Color(todo.backColor))
                        .foregroundColor(Color(todo.backColor))
                        .cornerRadius(20)
                        .padding()
                 
                    HStack(spacing: 2) {
                        ForEach((0..<3), id: \.self) { item in
                            Circle()
                                .fill(item == index ? Color.purple : Color.purple.opacity(0.5))
                                .frame(width: 20, height: 20)      
                        }
                    }
                    .padding()
                    }.onAppear {
                        if index == 3 {
                            viewStore.send(.tabIndexChange(index: 0))
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            
        }
        .frame(height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
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


struct CardView: Equatable, Identifiable {
    var id: UUID
    var title: String
    var backColor: String
}


struct AppState: Equatable {
    var cards:[CardView]
    @BindableState var tabIndex:Int = 0
    
}

enum AppAction {
    case backColorChange(index: Int, text: String)
    case tabIndexChange(index: Int)
        
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
        
    case .tabIndexChange(index: let index):
        state.tabIndex = index
        return .none
        
    case .backColorChange(index: let index, text: let text):
        state.cards[index].title = text
        return .none
        
    }
}
    .debug()


//func counterIndexTab(state: inout AppState, action: AppAction) {
//    switch action {
//
//    case .tabIndexChange(_):
//        state.tabIndex += 1
//    }

//}

struct AppEnvironment {}




