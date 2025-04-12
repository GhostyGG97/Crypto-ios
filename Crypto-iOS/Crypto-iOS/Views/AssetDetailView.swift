import SwiftUI

struct AssetDetailView: View {
    let asset: Asset
    
    var body: some View {
        Text(asset.name)
            .navigationTitle(asset.name)
    }
}

#Preview{
    AssetDetailView(
        asset: .init(
            id: "bitcoin",
            name: "Bitcoin",
            symbol: "BTC",
            priceUsd: "89999",
            changePercent24Hr: "6.99"
        )
    )
}
