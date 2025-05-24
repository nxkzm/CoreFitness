import ComposableArchitecture
import SwiftUI

struct LoginScreen: View {
    let store: StoreOf<LoginCore>

    init(store: StoreOf<LoginCore>) {
        self.store = store
    }
    
    var body: some View {
        ZStack {
            Text("LoginScreen")
        }
    }
}

#Preview {
    let store = Store(initialState: LoginCore.State()) {
        LoginCore()
    }
    LoginScreen(store: store)
}
