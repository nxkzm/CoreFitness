import SwiftUI
import Foundation

struct RecordRowView: View {
    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    let item: RecordItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                // タグ
                Text(item.type.label)
                    .font(.caption2)
                    .foregroundColor(item.type.tagForegroundColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(item.type.tagBackgroundColor)
                    .cornerRadius(8)

                // タイトル
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)

                // 詳細
                detailView
            }

            Spacer()

            // 記録時間
            Text(Self.timeFormatter.string(from: item.date))
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.all, 15)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
    }

    @ViewBuilder
    private var detailView: some View {
        switch item.type {
        case .training:
            trainingView
        case .meal:
            mealView
        }
    }

    private var trainingView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("メニュー: \(item.trainingMenu)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("重量: \(item.weight)  レップ: \(item.reps)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    private var mealView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("食事内容: \(item.mealContent)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("カロリー: \(item.calories)kcal")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
