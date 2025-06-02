import SwiftUI

/// 記録入力シート
struct RecordEntrySheet: View {
    @State private var item: RecordItem
    let onSave: (RecordItem) -> Void
    let onCancel: () -> Void
    private var isSaveDisabled: Bool {
        switch item.type {
        case .training:
            return item.trainingMenu.isEmpty
        case .meal:
            return item.mealContent.isEmpty
        }
    }

    init(
        item: RecordItem,
        onSave: @escaping (RecordItem) -> Void,
        onCancel: @escaping () -> Void
    ) {
        _item = State(initialValue: item)
        self.onSave = onSave
        self.onCancel = onCancel
    }

    var body: some View {
        NavigationStack {
            Form {
                // カテゴリ選択
                Section(header: Text("カテゴリを選択")) {
                    Picker("カテゴリ", selection: $item.type) {
                        ForEach(RecordType.allCases) { type in
                            Text(type.label).tag(type)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                // 日付
                HStack(spacing: 6) {
                    Image(systemName: "calendar")
                        .font(.subheadline)
                        .foregroundColor(.accentColor)

                    Text(item.date, style: .date)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }

                // カテゴリに応じた入力フィールド
                inputSection
            }
            .navigationTitle("記録入力")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("キャンセル", action: onCancel)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        onSave(item)
                    }
                    .disabled(isSaveDisabled)
                }
            }
        }
    }

    @ViewBuilder
    private var inputSection: some View {
        switch item.type {
        case .training:
            trainingSection
        case .meal:
            mealSection
        }
    }

    private var trainingSection: some View {
        Section(header: Text("トレーニング内容")) {
            TextField("メニューを入力", text: $item.trainingMenu)
            .autocapitalization(.none)

            TextField("重量 (kg)", text: $item.weight)
            .keyboardType(.numberPad)

            TextField("回数", text: $item.reps)
            .keyboardType(.numberPad)
        }
    }

    private var mealSection: some View {
        Section(header: Text("食事内容")) {
            TextField("食事内容を入力", text: $item.mealContent)
            .autocapitalization(.none)

            TextField("カロリー (kcal)", text: $item.calories)
            .keyboardType(.numberPad)
        }
    }
}
