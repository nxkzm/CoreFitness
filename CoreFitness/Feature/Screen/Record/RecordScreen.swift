import ComposableArchitecture
import SwiftUI

struct RecordScreen: View {
    let store: StoreOf<RecordCore>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationStack {
                ZStack {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: .zero) {
                            Text("RecordScreen")
                                .padding(.vertical, 100)
                        }
                    }
                    .ignoresSafeArea(.container, edges: .bottom)
                }
                .navigationTitle("RecordScreen")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    let store = Store(initialState: RecordCore.State()) {
        RecordCore()
    }
    RecordScreen(store: store)
}
