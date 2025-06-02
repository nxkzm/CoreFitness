import SwiftUI

enum RecordType: Int, Identifiable, Equatable, CaseIterable {
    case training = 1
    case meal

    var id: Int { rawValue }

    var label: String {
        switch self {
        case .training: return L10n.labelTraining
        case .meal: return L10n.labelMeal
        }
    }

    var tagBackgroundColor: Color {
        switch self {
        case .training:
            return Color.blue.opacity(0.2)
        case .meal:
            return Color.green.opacity(0.2)
        }
    }

    var tagForegroundColor: Color {
        switch self {
        case .training:
            return Color.blue
        case .meal:
            return Color.green
        }
    }
}
