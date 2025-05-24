import ComposableArchitecture
import Foundation

@Reducer
struct FooterCore {
    struct State: Equatable {
        var tab: TabItem = .record
        var prevTab: TabItem = .record
        var isEnabled = true
    }

    enum Action: Equatable {
        case viewAppeared
        case tabSelected(TabItem)
        case tabChanged
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared:
                return .none

            case .tabSelected(let tab):
                return .send(.tabChanged)

            case .tabChanged:
                return .none
            }
        }
    }
}
