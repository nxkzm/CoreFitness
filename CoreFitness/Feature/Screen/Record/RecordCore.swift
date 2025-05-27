import ComposableArchitecture
import SwiftUI

/// 記録画面
@Reducer
struct RecordCore {
    struct State: Equatable {
        // カレンダー選択日
        @BindingState var selectedDate = Date()
        @BindingState var showsEntrySheet: Bool = false
        var records: [TrainingRecord] = []
    }

    enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        case dateTapped(Date)
        case addButtonTapped
        case entrySaved(String)
        case entrySheetDismissed
    }

    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .binding:
                return .none

            case .dateTapped(let selectedDate):
                state.selectedDate = selectedDate
                return .none

            case .addButtonTapped:
                state.showsEntrySheet = true
                return .none

            case .entrySaved(let content):
                let record = TrainingRecord(
                    date: state.selectedDate,
                    content: content
                )
                state.records.append(record)
                state.showsEntrySheet = false
                return .none

            case .entrySheetDismissed:
                state.showsEntrySheet = false
                return .none
            }
        }
    }
}
