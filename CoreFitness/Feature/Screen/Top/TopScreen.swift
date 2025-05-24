import SwiftUI
import ComposableArchitecture

struct TopScreen: View {
    struct ViewState: Equatable {
        let footer: FooterCore.State
        let isAtAllTopScreen: Bool

        init(state: TopCore.State) {
            footer = state.footer
            isAtAllTopScreen = state.isAtAllTopScreen
        }
    }

    let store: StoreOf<TopCore>
    @ObservedObject private var viewStore: ViewStore<ViewState, TopCore.Action>

    init(store: StoreOf<TopCore>) {
        self.store = store
        viewStore = .init(store, observe: ViewState.init(state:))
    }

    var body: some View {
        ZStack {
            // MARK: メイン画面
            VStack(spacing: .zero) {
                switch viewStore.footer.tab {
                case .record:
                    // Record画面
                    Text("RecordScreen")

                case .chat:
                    // Chat画面
                    Text("ChatScreen")

                case .timeline:
                    // Timeline画面
                    Text("TimelineScreen")

                case .myPage:
                    // MyPage画面
                    Text("MyPageScreen")
                }
                if viewStore.isAtAllTopScreen {
                    // フッターの高さ確保
                    Spacer().frame(height: 60)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)

            // MARK: フッター
            FooterScreen(store: store.scope(state: \.footer, action: \.footer))
                // 各タブのTOP画面にいる場合のみ表示
                .opacity(viewStore.isAtAllTopScreen ? 1 : 0)
        }
    }
}

#Preview {
    let store = Store(initialState: TopCore.State()) {
        TopCore()
    }
    TopScreen(store: store)
}
