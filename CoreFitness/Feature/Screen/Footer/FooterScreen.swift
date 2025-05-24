import SwiftUI
import ComposableArchitecture

struct FooterScreen: View {
    @ObservedObject private var viewStore: ViewStoreOf<FooterCore>

    init(store: StoreOf<FooterCore>) {
        viewStore = ViewStore(store, observe: { $0 })
    }

    var body: some View {
        Text("FooterScreen")
    }
}
