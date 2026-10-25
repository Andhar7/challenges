//
//  CardView.swift
//  challenges
//
//  Created by Gurudev on 25.10.2026.
//

import SwiftUI

extension Color {
    static let gold = Color(red: 0.95, green: 0.69, blue: 0.13)
    static let violet = Color(red: 0.56, green: 0.35, blue: 0.97)
    static let sky = Color(red: 0.26, green: 0.76, blue: 0.97)
}


struct CardView: View {
    let symbol: String
    let symbolColor: Color
    let value: String
    let label: String
    let strokeColor: Color

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: symbol)
                .font(.system(size: 33, weight: .heavy))
                .foregroundStyle(symbolColor)
            VStack(spacing: 3) {
                Text(value)
                Text(label)
            }
            .font(.system(size: 21, weight: .bold, design: .serif))
            .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, minHeight: 180)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(strokeColor, lineWidth: 2)
        }
    }
}

