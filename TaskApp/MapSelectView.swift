import SwiftUI

struct MapSelectView: View {
    let onSelect: (Double, Double) -> Void

    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0

    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero

    var body: some View {
        GeometryReader { geo in
            Image("store_map")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale)
                .offset(offset)
                .frame(width: geo.size.width, height: geo.size.height)
                .contentShape(Rectangle())

                // 1本指ドラッグで移動
                .gesture(panGesture())

                // 拡大
                .gesture(zoomGesture())

                // タップ位置取得
                .simultaneousGesture(
                    SpatialTapGesture()
                        .onEnded { value in
                            let tapPoint = value.location

                            let imageSize = UIImage(named: "store_map")!.size
                            let viewSize = geo.size

                            let baseScale = min(
                                viewSize.width / imageSize.width,
                                viewSize.height / imageSize.height
                            )

                            let imageWidth = imageSize.width * baseScale * scale
                            let imageHeight = imageSize.height * baseScale * scale

                            let xOffset =
                                (viewSize.width - imageWidth) / 2 + offset.width
                            let yOffset =
                                (viewSize.height - imageHeight) / 2 + offset.height

                            let x = (tapPoint.x - xOffset) / imageWidth
                            let y = (tapPoint.y - yOffset) / imageHeight

                            guard x >= 0, x <= 1, y >= 0, y <= 1 else { return }
                            onSelect(x, y)
                        }
                )
        }
    }

    private func zoomGesture() -> some Gesture {
        MagnificationGesture()
            .onChanged { value in
                scale = min(max(lastScale * value, 1.0), 4.0)
            }
            .onEnded { _ in
                lastScale = scale
            }
    }

    private func panGesture() -> some Gesture {
        DragGesture(minimumDistance: 10)
            .onChanged { value in
                offset = CGSize(
                    width: lastOffset.width + value.translation.width,
                    height: lastOffset.height + value.translation.height
                )
            }
            .onEnded { _ in
                lastOffset = offset
            }
    }
}
