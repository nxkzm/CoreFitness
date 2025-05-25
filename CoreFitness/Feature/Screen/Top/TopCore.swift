import ComposableArchitecture
import Foundation

@Reducer
struct TopCore {
    struct State: Equatable {
        var record = RecordCore.State()
        var footer = FooterCore.State()
        var isAtAllTopScreen: Bool {
            true
        }
    }

    enum Action: Equatable {
        case record(RecordCore.Action)
        case footer(FooterCore.Action)
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .footer(.tabChanged):
                return .none

            case .record, .footer:
                return .none
            }
        }
        Scope(state: \.record, action: \.record) {
            RecordCore()
        }
        Scope(state: \.footer, action: \.footer) {
            FooterCore()
        }
    }
}
