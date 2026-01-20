import SwiftUI

struct MapDisplayView: View {
    let x: Double
    let y: Double

    var body: some View {
        GeometryReader { geo in
            let imageSize = UIImage(named: "store_map")!.size
            let viewSize = geo.size

            let scale = min(
                viewSize.width / imageSize.width,
                viewSize.height / imageSize.height
            )

            let imageWidth = imageSize.width * scale
            let imageHeight = imageSize.height * scale

            let xOffset = (viewSize.width - imageWidth) / 2
            let yOffset = (viewSize.height - imageHeight) / 2

            ZStack {
                Image("store_map")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: viewSize.width, height: viewSize.height)

                Circle()
                    .fill(Color.red)
                    .frame(width: 14, height: 14)
                    .position(
                        x: xOffset + imageWidth * x,
                        y: yOffset + imageHeight * y
                    )
            }
        }
    }
}
