//
//  NumberView.swift
//  AwardsCollectionApp
//
//  Created by Евгений Волошенко on 23.05.2022.
//

import SwiftUI

struct NumberView: View {
    
    @Binding var number: Number
    let size: CGFloat
    
    var body: some View {
        ZStack {
            switch number {
            case .one:
                PointView(size: size, position: .five)
            case .two:
                PointView(size: size, position: .one)
                PointView(size: size, position: .nine)
            case .three:
                PointView(size: size, position: .one)
                PointView(size: size, position: .five)
                PointView(size: size, position: .nine)
            case .four:
                PointView(size: size, position: .one)
                PointView(size: size, position: .three)
                PointView(size: size, position: .seven)
                PointView(size: size, position: .nine)
            case .five:
                PointView(size: size, position: .one)
                PointView(size: size, position: .three)
                PointView(size: size, position: .five)
                PointView(size: size, position: .seven)
                PointView(size: size, position: .nine)
            case .six:
                PointView(size: size, position: .one)
                PointView(size: size, position: .three)
                PointView(size: size, position: .four)
                PointView(size: size, position: .six)
                PointView(size: size, position: .seven)
                PointView(size: size, position: .nine)
            }
        }
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(number: .constant(.five), size: 100)
            .frame(width: 100, height: 100)
            .previewLayout(.sizeThatFits)
    }
}
