import ComposableArchitecture
import SwiftUI

@Reducer
struct RecordCore {
    struct State: Equatable {}
    enum Action: Equatable {}

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {}
        }
    }
}
