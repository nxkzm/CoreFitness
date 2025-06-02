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
                Section(header: Text(L10n.labelSelectCategory)) {
                    Picker(L10n.labelCategory, selection: $item.type) {
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
            .navigationTitle(L10n.labelInputRecord)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(L10n.labelCancel, action: onCancel)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(L10n.labelSave) {
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
        Section(header: Text(L10n.labelContentTraining)) {
            TextField(L10n.labelInputMenu, text: $item.trainingMenu)
            .autocapitalization(.none)

            TextField(L10n.labelWeight, text: $item.weight)
            .keyboardType(.numberPad)

            TextField(L10n.labelReps, text: $item.reps)
            .keyboardType(.numberPad)
        }
    }

    private var mealSection: some View {
        Section(header: Text(L10n.labelMealContentTitle)) {
            TextField(L10n.labelInputMealContent, text: $item.mealContent)
            .autocapitalization(.none)

            TextField(L10n.labelCaloriesPlaceholder, text: $item.calories)
            .keyboardType(.numberPad)
        }
    }
}
