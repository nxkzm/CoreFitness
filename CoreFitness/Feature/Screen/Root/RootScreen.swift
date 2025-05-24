import ComposableArchitecture
import SwiftUI

struct RootScreen: View {
    let store: StoreOf<RootCore>

    var body: some View {
        ZStack {
            // MARK: LoginScreen or TopScreen
            SwitchStore(store.scope(state: \.screenState, action: \.self)) { state in
                switch state {
                case .loggedIn:
                    CaseLet(
                        /RootCore.State.ScreenState.loggedIn,
                        action: RootCore.Action.loggedIn,
                        then: TopScreen.init
                    )

                case .loggedOut:
                    CaseLet(
                        /RootCore.State.ScreenState.loggedOut,
                        action: RootCore.Action.loggedOut,
                        then: LoginScreen.init
                    )
                }
            }
        }
    }
}

#Preview {
    let store = Store(initialState: RootCore.State()) {
        RootCore()
    }
    RootScreen(store: store)
}
