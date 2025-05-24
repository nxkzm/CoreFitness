import ComposableArchitecture
import Foundation
import SwiftUI

@Reducer
struct RootCore {
    struct State: Equatable {
        @CasePathable
        enum ScreenState: Equatable {
            case loggedIn(TopCore.State)
            case loggedOut(LoginCore.State)
        }

        // LoginScreen or TopScreen
        var screenState: ScreenState = .loggedOut(.init())
    }

    enum Action: Equatable {
        case loggedIn(TopCore.Action)
        case loggedOut(LoginCore.Action)
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .loggedIn, .loggedOut:
                return .none
            }
        }
        Scope(state: \.screenState, action: \.self) {
            Scope(state: \.loggedIn, action: \.loggedIn) {
                TopCore()
            }
            Scope(state: \.loggedOut, action: \.loggedOut) {
                LoginCore()
            }
        }
    }
}
