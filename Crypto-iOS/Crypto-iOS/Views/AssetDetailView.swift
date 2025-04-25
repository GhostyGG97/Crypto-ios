import SwiftUI

struct AssetDetailView: View {
    let viewModel: AssetDetailsViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.asset.name)
            Button{
                Task {
                    await viewModel.addToFavourites()
                }
            }label:{
                Text("Add to favourites")
            }
        }
        
        .navigationTitle(viewModel.asset.name)
    }
}

#Preview{
    NavigationStack{
        AssetDetailView(
            viewModel: .init(
                asset: .init(
                    id: "bitcoin",
                    name: "Bitcoin",
                    symbol: "BTC",
                    priceUsd: "89999",
                    changePercent24Hr: "6.99"
                )   
            )
        )
    }
}
    
