import SwiftUI

struct FooterTabView: View {
    static let viewHeight: CGFloat = 60
    static let safeAreaBottom: CGFloat = 10
    let selectedTab: TabItem
    let onSelect: (TabItem) -> Void

    var body: some View {
        HStack {
            ForEach(TabItem.allCases, id: \.self) { item in
                FooterTabItemView(
                    item: item,
                    isSelected: selectedTab == item
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture { onSelect(item) }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: Self.viewHeight)
        .padding(.bottom, Self.safeAreaBottom)
        .padding(.horizontal, 15)
    }
}
