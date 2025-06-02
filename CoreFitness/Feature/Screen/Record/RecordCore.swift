import ComposableArchitecture
import SwiftUI

/// 記録画面
@Reducer
struct RecordCore {
    struct State: Equatable {
        @BindingState var selectedDate = Date()
        @BindingState var showsEntrySheet: Bool = false
        @BindingState var showsActionSheet = false
        var records: [RecordItem] = []
        var selectedRecordID: UUID?
        var editItem: RecordItem?
        /// 総摂取カロリー / 日
        var dailyCalories: String {
            let sum = records
                .filter { record in
                    Calendar.current.isDate(
                        record.date,
                        equalTo: selectedDate,
                        toGranularity: .day
                    )
                    && record.type == .meal
                }
                .reduce(0) { partialSum, record in
                    partialSum + (Int(record.calories) ?? 0)
                }
            return "\(sum)"
        }
    }

    enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        case dateTapped(Date)
        case addButtonTapped
        case recordTapped(UUID)
        case actionSheetCancelled
        case deleteConfirmed
        case editConfirmed
        case entrySaved(RecordItem)
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
                state.editItem = .init(date: state.selectedDate, type: .training)
                state.selectedRecordID = nil
                state.showsEntrySheet = true
                return .none

            case .recordTapped(let id):
                state.selectedRecordID = id
                state.showsActionSheet = true
                return .none

            case .actionSheetCancelled:
                state.showsActionSheet = false
                state.selectedRecordID = nil
                return .none

            case .deleteConfirmed:
                if let id = state.selectedRecordID {
                    state.records.removeAll { $0.id == id }
                }
                state.showsActionSheet = false
                state.selectedRecordID = nil
                return .none

            case .editConfirmed:
                if let item = state.records.first(where: { $0.id == state.selectedRecordID }) {
                    state.editItem = item
                    state.showsEntrySheet = true
                }
                state.showsActionSheet = false
                return .none

            case .entrySaved(let newItem):
                if let index = state.records.firstIndex(where: { $0.id == state.editItem?.id }) {
                    // 選択されたレコードが存在する場合、編集
                    state.records[index] = newItem
                } else {
                    // 選択されたレコードが存在しない場合、新規追加
                    state.records.append(newItem)
                }
                state.showsEntrySheet = false
                state.selectedRecordID = nil
                state.editItem = nil
                return .none

            case .entrySheetDismissed:
                state.showsEntrySheet = false
                state.selectedRecordID = nil
                state.editItem = nil
                return .none
            }
        }
    }
}
