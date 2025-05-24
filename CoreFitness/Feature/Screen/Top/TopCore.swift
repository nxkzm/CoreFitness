import ComposableArchitecture
import Foundation

@Reducer
struct TopCore {
    struct State: Equatable {
        var footer = FooterCore.State()
        var isAtAllTopScreen: Bool {
            true
        }
    }

    enum Action: Equatable {
        case footer(FooterCore.Action)
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .footer(.tabChanged):
                return .none

            case .footer:
                return .none
            }
        }
        Scope(state: \.footer, action: \.footer) {
            FooterCore()
        }
    }
}
