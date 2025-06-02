import Foundation

struct RecordItem: Equatable, Identifiable {
    let id = UUID()
    var date: Date
    var type: RecordType
    // トレーニング
    var trainingMenu: String = ""
    var weight: String = ""
    var reps: String = ""
    // 食事
    var mealContent: String = ""
    var calories: String = ""
    // タイトル
    var title: String {
        trainingMenu.isEmpty ?  mealContent : trainingMenu
    }
}
