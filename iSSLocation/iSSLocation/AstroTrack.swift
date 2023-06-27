import SwiftUI

@main
struct AstroTrack: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            TabView {
                FrontPageView()
                    .tabItem {
                        Image(systemName: "map.fill")
                    }
                CrewMembersView()
                    .tabItem {
                        Image(systemName: "person.3.fill")
                    }
                AboutAppView()
                    .tabItem {
                        Image(systemName: "app.fill")
                    }
            }
            .onAppear {
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithDefaultBackground()
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
            .tint(.primary)
        }
    }
}
