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

// MARK: 5. Controlling the animation stack
// You can attach the animation modifier multiple times and the order matters.

// MARK: 6. Animating gestures
// Animate based on use input like so:
// .gesture(
//    DragGesture()
//        .onChanged { self.dragAmount = $0.translation }
//        .onEnded { _ in
//            self.dragAmount = .zero
//            self.enabled.toggle()
//        }
//   )

// MARK: 7. Showing and hiding views with transitions
// Neat.

// MARK: 8. Building custom transitions using ViewModifier
// rotationEffect() lets us rotate a view in 2D space, and clipped() stops the view from being drawn outside of its rectangular space.
// rotationEffect() is similar to rotation3DEffect(), except it always rotates around the Z axis. However, it also gives us the ability to control the anchor point of the rotation – which part of the view should be fixed in place as the center of the rotation.

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
//    @State private var animationAmount: CGFloat = 1 // <- Basically a Double, but not. Have to use type annotation to make Swift happy.
    
//    @State private var animationAmount = 0.0 // <- Double this time. (4)
    
//    let letters = Array("Hello SwiftUI")
//    @State private var enabled = false // (5, 6)
//    @State private var dragAmount = CGSize.zero // (6)
    
    @State private var isShowingRed = false // (7)
    
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
        
//        Button("Tap Me") { // (4)
//            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                self.animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
//        Button("Tap Me") { // (5)
//            self.enabled.toggle()
//        }
//        .frame(width: 200, height: 200) // <- Modifier order matters.
//        .background(enabled ? Color.blue : Color.red)
//        .animation(.default)
//        .animation(nil) // <- Disables animations before this point. Necessary, because changing order changes the button.
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60: 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1)) // <- Controls everything before it up to the next animation.
        
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { self.dragAmount = $0.translation }
////                    .onEnded { _ in self.dragAmount = .zero } // <- Implicit
//                    .onEnded { _ in
//                        withAnimation(.spring()) { // <- Explicit
//                            self.dragAmount = .zero
//                        }
//                    }
//            )
////            .animation(.spring()) // <- Implicit
        
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(self.letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(self.enabled ? Color.blue : Color.red)
//                    .offset(self.dragAmount)
//                    .animation(Animation.default.delay(Double(num / 20)))
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { self.dragAmount = $0.translation }
//                .onEnded { _ in
//                    self.dragAmount = .zero
//                    self.enabled.toggle()
//                }
//        )
        
        VStack { // (7)
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
//                    .transition(.scale) // <- THE TRANSITION
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity)) // <- Lets you show/hide in different ways.
                    .transition(.pivot) // <- Custom animation
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
