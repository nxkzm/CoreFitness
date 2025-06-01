import Foundation

struct RecordItem: Equatable, Identifiable {
    let id = UUID()
    var date: Date
    var content: String
}
