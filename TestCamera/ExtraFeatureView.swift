//
//  ExtraFeatureView.swift
//  TestCamera
//
//  Created by Balutoiu Rares on 05/11/2023.
//

import Foundation
import SwiftUI

struct ExtraFeatureView: View {
    //start the painting as a nearly blank by making the transparency low.
    @State private var opacity: Double = 0.01
    var body: some View {
        
        //Junjie's main ui codes starts here
        VStack {
                    Image("Mona_Lisa,_by_Leonardo_da_Vinci,_from_C2RMF") // Load your finished image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(opacity)
                        .gesture(
                                            DragGesture().onChanged { gesture in
                                                // Check the direction of the swipe (up or down)
                                                if gesture.translation.height < 0 {
                                                    // User swiped up, increase opacity
                                                    increaseOpacity(by: 0.003)
                                                }
                                            }
                                        )
            ProgressView(value: opacity, total: 1)
//            DrawingViewWrapper(finishedImage: UIImage(named: "Mona_Lisa,_by_Leonardo_da_Vinci,_from_C2RMF"))
                         
                }
        
                .padding()
        //Junjie's main ui codes end here
        
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

//struct ExtraFeatureView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExtraFeatureView()
//    }
//}

