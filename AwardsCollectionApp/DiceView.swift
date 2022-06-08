//
//  DiceView.swift
//  AwardsCollectionApp
//
//  Created by Евгений Волошенко on 20.05.2022.
//

import SwiftUI

enum Number: CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
}

struct DiceView: View {
    
    @State private var number: Number = Number.allCases.randomElement()!
    @State private var animationIsOn = false
    let buttonIsHidden: Bool
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                
                let wight = geometry.size.width
                let hight = geometry.size.width
                
                let size = min(wight, hight)
                
                let nearLine = size * 0.1
                let farLine = size * 0.9
                
                VStack(spacing: 100) {
                    ZStack {
                        Path { path in
                            path.addRoundedRect(in: CGRect(x: nearLine, y: nearLine, width: farLine - nearLine, height: farLine - nearLine), cornerSize: CGSize(width: nearLine, height: nearLine))
                        }
                        .fill(RadialGradient(colors: [.white, .brown],
                                             center: .center,
                                             startRadius: nearLine,
                                             endRadius: farLine))
                        
                        NumberView(number: $number, size: size)
                            .animation(.spring(), value: number)
                    }
                    .shadow(color: .black.opacity(0.4), radius: 10)
                }
            }
            if !buttonIsHidden {
                Button() {
                    roleDice()
                } label: {
                    Text("Roll!")
                }
                .disabled(animationIsOn)
            }
        }
    }
    
    private func getRandomNumber() {
        var withoutCurrentNumber: [Number] = []
        for index in 0 ..< Number.allCases.count {
            if Number.allCases[index] != number {
                withoutCurrentNumber.append(Number.allCases[index])
            }
        }
        guard let randomNumber = withoutCurrentNumber.randomElement() else { return }
        number = randomNumber
    }
    
    private func roleDice() {
        animationIsOn = true
        for index in 0 ..< 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 + 0.5 * Double(index)) {
                getRandomNumber()
                if index == 4 {
                    animationIsOn = false
                }
            }
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(buttonIsHidden: true).frame(width: 200, height: 200)
            .previewLayout(.sizeThatFits)
    }
}
