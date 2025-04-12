import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house"){
                NavigationStack{
                    AssetList()
                        .navigationTitle("Home")
                }
            }
            Tab("Favourites", systemImage: "star"){
                Text("Settings")
            }
            Tab("Settings", systemImage: "gear"){
                Text("Settings")
            }
        }
    }
}

#Preview {
    AppTabView()
}
