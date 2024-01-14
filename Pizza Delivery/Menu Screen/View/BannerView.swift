//
//  BannerView.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 13/01/24.
//

import SwiftUI

struct BannerView: View {
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: columns,
                content: {
                    ForEach(banners) { banner in
                        Image(banner.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            )
            .frame(height: 130)
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 10)
    }
}

#Preview {
    BannerView()
}
