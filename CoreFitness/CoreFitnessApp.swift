import SwiftUI
import ComposableArchitecture

@main
struct CoreFitnessApp: App {
    let store = Store(initialState: RootCore.State()) {
        RootCore()
    }

    var body: some Scene {
        WindowGroup {
            RootScreen(store: store)
        }
    }
}
