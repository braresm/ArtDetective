import SwiftUI

struct ExtraFeatureView: View {
    @State private var opacity: Double = 0.01
    @State private var isShowingScannedArtView = false // State to control navigation

    var body: some View {
        NavigationView {
            VStack {
                Text("Sfumato technique uses soft, careful brush moves, now you turn!")
                ZStack {
                    Image("Mona_Lisa,_by_Leonardo_da_Vinci,_from_C2RMF") // Load your finished image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(opacity)
                        .gesture(
                            DragGesture().onChanged { gesture in
                                if gesture.translation.height < 0 {
                                    increaseOpacity(by: 0.003)
                                }
                            }
                    )
                }
                ProgressView(value: opacity, total: 1)
                
                Button(action: {
                    // Skip this painting part and navigate to ScannedArtView
                    isShowingScannedArtView = true
                }) {
                    Text("Skip")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)

                // NavigationLink to navigate to ScannedArtView
                NavigationLink(destination: ScannedArtView(image: UIImage(named: "Mona_Lisa,_by_Leonardo_da_Vinci,_from_C2RMF")!)) {
                    EmptyView()
                }
                .opacity(0)
            }
            .padding()
            .navigationBarHidden(true)

            // Attach a NavigationLink outside the VStack to navigate to ScannedArtView
            .background(
                NavigationLink(
                    destination: ScannedArtView(image: UIImage(named: "Mona_Lisa,_by_Leonardo_da_Vinci,_from_C2RMF")!),
                    isActive: $isShowingScannedArtView,
                    label: {
                        EmptyView()
                    }
                )
            )
        }
    }

    func increaseOpacity(by amount: Double) {
        if opacity < 1.0 {
            opacity += amount
            if opacity > 1.0 {
                opacity = 1.0
            }
        }
    }
}

struct ExtraFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraFeatureView()
    }
}
