//
//  ExtraFeatureView.swift
//  TestCamera
//
//  Created by Balutoiu Rares on 05/11/2023.
//

import Foundation
import SwiftUI

struct ExtraFeatureView: View {
    @State private var opacity: Double = 0.01
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sfumato technique uses soft, careful brush moves, now you turn!")
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
                ProgressView(value: opacity, total: 1)
                
                    .padding(.bottom, 20)
                
                Button(action: {
                    // Handle the quit action here, e.g., navigate back or close the view
                }) {
                    Text("Skip")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity) // Make the button as wide as the screen
                        .background(Color.blue) // Blue background
                        .foregroundColor(Color.white) // White text
                        .cornerRadius(10) // Add rounded corners
                }
                .padding(.bottom, 20) // Add a bottom padding
            }
            .padding()
            .navigationBarHidden(true) // Hide the navigation bar
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


