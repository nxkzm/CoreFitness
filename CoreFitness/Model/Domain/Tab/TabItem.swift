import Foundation
import SwiftUI

public enum TabItem: Equatable, CaseIterable {
    case record
    case chat
    case timeline
    case myPage

    public var label: String {
        switch self {
        case .record: return L10n.labelRecord
        case .chat: return L10n.labelChat
        case .timeline: return L10n.labelTimeline
        case .myPage: return L10n.labelMyPage
        }
    }

    public var icon: Image {
        switch self {
        case .record: return Image(systemName: "note.text.badge.plus")
        case .chat: return Image(systemName: "ellipsis.message.fill")
        case .timeline: return Image(systemName: "bubble.and.pencil")
        case .myPage: return Image(systemName: "person.crop.circle")
        }
    }
}
