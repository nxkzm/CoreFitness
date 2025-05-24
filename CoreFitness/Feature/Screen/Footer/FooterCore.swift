import ComposableArchitecture
import Foundation

@Reducer
struct FooterCore {
    struct State: Equatable {
        var tab: TabItem = .record
        var prevTab: TabItem = .record
    }

    enum Action: Equatable {
        case tabSelected(TabItem)
        case tabChanged
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .tabSelected(let tab):
                state.prevTab = state.tab
                state.tab = tab
                return .send(.tabChanged)

            case .tabChanged:
                // TopCore
                return .none
            }
        }
    }
}
