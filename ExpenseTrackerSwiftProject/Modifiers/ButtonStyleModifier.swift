//
//  ButtonStyleModifier.swift
//  ExpenseTrackerSwiftProject
//
//  Created by Sahayak Sharma on 03/11/25.
//

import SwiftUI

struct CustomGlowButton: View {
    @State private var deg = 0.0
    var buttonText:String
    var onPressAction:()->Void
    var isFunctionAsync:Bool = false

    var body: some View {
        ZStack{
            Circle()
                .fill(AngularGradient(colors: [.yellow,.orange,.yellow,.yellow,.yellow], center: .center, angle: Angle(degrees: 120)))
                .blur(radius: 5)
                .rotationEffect(Angle(degrees: deg))
                .onAppear(){
                    withAnimation(.easeIn(duration: 10).repeatForever(autoreverses: false)){
                        deg+=360
                    }
                }
                .mask {
                    Capsule()
                        .frame(height: 50)
                        .blur(radius: 10)
                }
            Capsule()
                .fill(Color.yellow)
                .frame(height: 54)
            
            Text(buttonText)
                .font(.headline)
                .fontDesign(.monospaced)
                .fontWeight(.bold)
        }
        .onTapGesture {
            Task{
                if isFunctionAsync{
                    await onPressAction()
                }
                else{
                    onPressAction()
                }
            }
        }
        .padding()
    }
}


#Preview {
    CustomGlowButton(buttonText: "Confirm SignIn") {
        print("you are logged in")
    }
}

