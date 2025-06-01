import ComposableArchitecture
import SwiftUI

/// 記録画面
@Reducer
struct RecordCore {
    struct State: Equatable {
        @BindingState var selectedDate = Date()
        @BindingState var showsEntrySheet: Bool = false
        @BindingState var showsActionSheet = false
        var records: [TrainingRecord] = []
        var selectedRecordID: UUID?
        var editContent = ""
    }

    enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        case dateTapped(Date)
        case addButtonTapped
        case recordTapped(UUID)
        case actionSheetCancelled
        case deleteConfirmed
        case editConfirmed
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
                state.editContent = ""
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
                if let id = state.selectedRecordID,
                   let record = state.records.first(where: { $0.id == id }) {
                    state.editContent = record.content
                    state.showsEntrySheet = true
                }
                state.showsActionSheet = false
                return .none

            case .entrySaved(let content):
                if let id = state.records.firstIndex(where: { $0.id == state.selectedRecordID }) {
                    // 選択されたレコードが存在する場合、編集
                    state.records[id].content = content
                } else {
                    // 選択されたレコードが存在しない場合、新規追加
                    let newRecord = TrainingRecord(
                        date: state.selectedDate,
                        content: content
                    )
                    state.records.append(newRecord)
                }
                state.showsEntrySheet = false
                state.selectedRecordID = nil
                return .none

            case .entrySheetDismissed:
                state.showsEntrySheet = false
                state.selectedRecordID = nil
                return .none
            }
        }
    }
}
