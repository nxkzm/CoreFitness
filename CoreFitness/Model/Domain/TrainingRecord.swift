import Foundation

struct TrainingRecord: Equatable, Identifiable {
    let id = UUID()
    var date: Date
    var content: String
}
