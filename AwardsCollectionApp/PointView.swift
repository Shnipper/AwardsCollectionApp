//
//  PointView.swift
//  AwardsCollectionApp
//
//  Created by Евгений Волошенко on 23.05.2022.
//

import SwiftUI

enum Position {
    case one
    case three
    case four
    case five
    case six
    case seven
    case nine
}

struct PointView: View {
    
    let size: CGFloat
    let position: Position
    
    var body: some View {
        
        let diameter = 0.15 * size
        let coordinates = getPointCoordinates(position: position, size: size)
        
        Path { path in
            path.addEllipse(in: CGRect(x: coordinates.0, y: coordinates.1, width: diameter, height: diameter))
        }
        .shadow(color: .black.opacity(0.4), radius:  5)
    }
    
    private func getPointCoordinates(position: Position, size: CGFloat) -> (CGFloat, CGFloat) {
        
        let middle = size / 2
        let radius = size * 0.075
        let coordinates: (x: CGFloat, y: CGFloat)
        
        switch position {
        case .one:
            coordinates = (0.5 * middle - radius + 0.25 * radius, 0.5 * middle - radius + 0.25 * radius)
        case .three:
            coordinates = (1.5 * middle - radius - 0.25 * radius, 0.5 * middle - radius + 0.25 * radius)
        case .four:
            coordinates = (0.5 * middle - radius + 0.25 * radius, middle - radius)
        case .five:
            coordinates = (middle - radius, middle - radius)
        case .six:
            coordinates = (1.5 * middle - radius - 0.25 * radius, middle - radius)
        case .seven:
            coordinates = (0.5 * middle - radius + 0.25 * radius, 1.5 * middle - radius - 0.25 * radius)
        case .nine:
            coordinates = (1.5 * middle - radius - 0.25 * radius, 1.5 * middle - radius - 0.25 * radius)
        }
        return coordinates
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView(size: 100, position: .five)
            .frame(width: 100, height: 100)
            .previewLayout(.sizeThatFits)
    }
}
