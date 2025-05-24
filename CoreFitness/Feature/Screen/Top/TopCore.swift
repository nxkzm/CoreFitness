import ComposableArchitecture
import Foundation

@Reducer
struct TopCore {
    struct State: Equatable {}

    enum Action: Equatable {}

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {}
        }
    }
}
