import SwiftUI
import ComposableArchitecture

struct FooterScreen: View {
    @ObservedObject private var viewStore: ViewStoreOf<FooterCore>

    init(store: StoreOf<FooterCore>) {
        viewStore = ViewStore(store, observe: { $0 })
    }

    var body: some View {
        FooterTabView(
            selectedTab: viewStore.tab,
            onSelect: { viewStore.send(.tabSelected($0)) }
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    let store = Store(initialState: FooterCore.State()) {
        FooterCore()
    }
    FooterScreen(store: store)
}
