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

                            HStack {
                                // 総摂取カロリー
                                Text("総摂取カロリー： \(viewStore.dailyCalories)kcal")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.green.opacity(0.5))
                                    .cornerRadius(10)
                                    .padding(.leading, 20)

                                Spacer()

                                // 記録追加ボタン
                                Button(action: {
                                    viewStore.send(.addButtonTapped)
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.accentColor)
                                }
                                .padding(.trailing, 20)
                            }
                            .padding(.vertical, 10)

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
                            ) { item in
                                RecordRowView(item: item)
                                .onTapGesture {
                                    viewStore.send(.recordTapped(item.id))
                                }
                            }
                            Spacer().frame(height: 20)
                        }
                    }
                }
                .background { Color(.secondarySystemBackground).ignoresSafeArea(.all) }
                .navigationTitle("RecordScreen")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .confirmationDialog(
                    "",
                    isPresented: viewStore.$showsActionSheet,
                    titleVisibility: .hidden
                ) {
                    Button("編集する") {
                        viewStore.send(.editConfirmed)
                    }
                    Button("削除する", role: .destructive) {
                        viewStore.send(.deleteConfirmed)
                    }
                    Button("キャンセル", role: .cancel) {
                        viewStore.send(.actionSheetCancelled)
                    }
                }
                .sheet(isPresented: viewStore.$showsEntrySheet) {
                    RecordEntrySheet(
                        item: viewStore.editItem ?? RecordItem(date: viewStore.selectedDate, type: .training),
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
