//
//  ContentView.swift
//  day32-Animations
//
//  Created by Michael Knepprath on 8/9/20.
//

// MARK: 1. Creating implicit animations
// .default animates all properties that change.

// MARK: 2. Customizing animations in SwiftUI
// Ease-in-ease-out is default.
// .easeOut changes the animation behavior. And you can get more granular from there.

// MARK: 3. Animating bindings
// You can animate the value of a binding. The difference between this and the previous section is that previously, the button had the animation applied to it. In this case, the animation is applied to the change in value that the button reads from.

// MARK: 4. Creating explicit animations
// A.K.A. Using withAnimation.

import SwiftUI

struct ContentView: View {
//    @State private var animationAmount: CGFloat = 1 // <- Basically a Double, but not. Have to use type annotation to make Swift happy.
    
    @State private var animationAmount = 0.0 // <- Double this time. (4)
    
    var body: some View {
//        Button("Tap Me") {
////            self.animationAmount += 1
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(Color.red)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation.easeInOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                )
//        )
//        .onAppear {
//            self.animationAmount = 2
//        }
        
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.default)
//        .animation(.easeOut)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
//        .animation(.easeInOut(duration: 2)) // <- This creates an animation struct.
//        .animation(
//            Animation.easeInOut(duration: 2)
//                .delay(1)
//        )
//        .animation(
//            Animation.easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true) // <- Setting repeat to 2 has issues... due to not matching state somehow?
//        )
//        .animation(
//            Animation.easeInOut(duration: 1)
//                .repeatForever(autoreverses: true)
//        )
        
//        print(animationAmount) // (4)
//
//        return VStack { // (4)
//            Stepper("Scale amount", value: $animationAmount.animation(
//                Animation.easeInOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//            ), in:  1...10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                self.animationAmount += 1
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
        
        Button("Tap Me") { // (4)
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
