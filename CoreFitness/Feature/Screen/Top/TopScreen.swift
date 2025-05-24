import SwiftUI
import ComposableArchitecture

struct TopScreen: View {
    let store: StoreOf<TopCore>

    init(store: StoreOf<TopCore>) {
        self.store = store
    }

    var body: some View {
        ZStack {
            // タイムライン画面
            Text("TimelineScreen")

            // レコード画面
            Text("RecordScreen")

            // マイページ画面
            Text("MyPageScreen")

            // チャット画面
            Text("ChatScreen")

            // フッター
            Text("FooterTab")
        }
    }
}

#Preview {
    let store = Store(initialState: TopCore.State()) {
        TopCore()
    }
    TopScreen(store: store)
}
