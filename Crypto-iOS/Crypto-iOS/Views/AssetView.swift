import SwiftUI

struct AssetViewState {
    let asset: Asset
    
    init(_ asset:Asset){
        self.asset = asset
    }
    
    var percentage: Double {
        Double (asset.changePercent24Hr) ?? 0
    }
    
    var formattedPrice: String {
        String(format: "%.2f", Double(asset.priceUsd) ?? 0)
    }
    
    var formattedPercentage: String{
        String(format: "%.2f", Double(asset.changePercent24Hr) ?? 0)
    }
    
    var iconUrl: URL? {
        URL(string: "https://assets.coincap.io/assets/icons/\(asset.symbol.lowercased())@2x.png")
    }
}

struct AssetView: View {
    
    let assetViewState: AssetViewState
    
    var body: some View {
        Grid {
            GridRow{
                AsyncImage(
                    url: assetViewState.iconUrl) {
                    image in image
                        .resizable()
                } placeholder: {
                    Image(
                        systemName: "dollarsign.gauge.chart.lefthalf.righthalf"
                    )
                        }
                .frame(
                    width: 40,
                    height:40
                )
                
                
                VStack (alignment: .leading){
                    Text(assetViewState.asset.symbol)
                        .font(.headline)
                    Text(assetViewState.asset.name)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            
            Spacer()
            
                Text(assetViewState.formattedPercentage)
                    .foregroundStyle(assetViewState.percentage >= 0 ? .green : .red)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text(assetViewState.formattedPrice)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        
        }
        
        .padding(.horizontal)
    }
}


#Preview {
    AssetView(
        assetViewState: .init(.init(
            id: "bitcoin",
            name: "Bitcoin",
            symbol: "BTC",
            priceUsd: "89999",
            changePercent24Hr: "6.99"
        ))
    )
}
