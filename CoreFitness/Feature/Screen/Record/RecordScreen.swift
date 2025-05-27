import ComposableArchitecture
import SwiftUI

/// 記録画面
struct RecordScreen: View {
    let store: StoreOf<RecordCore>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationStack {
                ZStack {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: .zero) {
                            // カレンダー
                            DatePicker(
                                "",
                                selection: viewStore.binding(
                                    get: \.selectedDate,
                                    send: RecordCore.Action.dateTapped
                                ),
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.graphical)
                            .background(Color(.white))
                            .padding(20)

                            // 記録追加ボタン
                            HStack {
                                Spacer()
                                Button(action: {
                                    viewStore.send(.addButtonTapped)
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.accentColor)
                                }
                                .padding(.trailing, 20)
                            }
                            .padding(.bottom, 10)

                            // 記録リスト
                            ForEach(
                                viewStore.records
                                  .filter { record in
                                    Calendar.current.isDate(
                                      record.date,
                                      equalTo: viewStore.selectedDate,
                                      toGranularity: .day
                                    )
                                  }
                            ) { record in
                            // TODO: リストのアイテムを編集可能 ＋ 削除可能に
                              Text(record.content)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.white))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .cornerRadius(8)
                            }
                        }
                    }
                }
                .background { Color(.secondarySystemBackground).ignoresSafeArea(.all) }
                .navigationTitle("RecordScreen")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .sheet(isPresented: viewStore.$showsEntrySheet) {
                    RecordEntrySheet(
                        date: viewStore.selectedDate,
                        onSave: { viewStore.send(.entrySaved($0)) },
                        onCancel: { viewStore.send(.entrySheetDismissed) }
                    )
                }
            }
        }
    }
}

#Preview {
    let store = Store(initialState: RecordCore.State()) {
        RecordCore()
    }
    RecordScreen(store: store)
}
