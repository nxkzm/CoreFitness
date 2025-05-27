import SwiftUI

/// 記録入力シート
struct RecordEntrySheet: View {
    @State private var content: String = ""
    let date: Date
    let onSave: (String) -> Void
    let onCancel: () -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(date, style: .date)) {
                    TextField("内容を入力", text: $content)
                }
            }
            .navigationTitle("記録入力")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("キャンセル", action: onCancel)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        onSave(content)
                    }
                    .disabled(content.isEmpty)
                }
            }
        }
    }
}
