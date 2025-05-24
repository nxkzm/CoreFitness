import SwiftUI

struct FooterTabItemView: View {
    let item: TabItem
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 5) {
            ZStack(alignment: .topTrailing) {
                item.icon
                    .renderingMode(.template)
                    .foregroundColor(
                        isSelected
                        ? Color.black
                        : Color.gray
                    )
                    .frame(width: 24, height: 24)
            }
            Text(item.label)
                .foregroundColor(isSelected ? Color.black : Color.gray)
                .lineLimit(1)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
