import ComposableArchitecture
import Foundation

@Reducer
struct LoginCore {
    struct State: Equatable {}

    enum Action: Equatable {}

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {}
        }
    }
}
