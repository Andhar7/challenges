//
//  ClaudeView.swift
//  challenges
//
//  Created by Gurudev on 25.10.2026.
//

import SwiftUI

struct ClaudeView: View {
    @State private var progress = 0.0

    private let ringGradient = AngularGradient(
        colors: [.orange, .pink, .purple, .orange],
        center: .center
    )

    var body: some View {
        VStack(spacing: 32) {
            header
            ring
            HStack(spacing: 12) {
                // StatCard(symbol: "figure.run", value: "7", label: "wins")
                // StatCard(symbol: "calendar", value: "42", label: "days")
                // StatCard(symbol: "medal.fill", value: "81", label: "miles/day")
                
                CardView(symbol: "figure.run", symbolColor: .sky,  value: "7", label: "wins", strokeColor: .gold)
                
                CardView(symbol: "27.calendar", symbolColor: .violet,   value: "42", label: "days", strokeColor: .sky)
                
                CardView(symbol: "medal",  symbolColor: .gold, value: "81", label: "miles/day", strokeColor: .violet)
            }
            Spacer()
            Text("Self-Transcendence gives us\njoy in boundless measure.")
                .font(.system(.title3, design: .serif).italic())
                .multilineTextAlignment(.center)
        }
        .padding(24)
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            LinearGradient(
                colors: [Color(red: 0.05, green: 0.08, blue: 0.25), .black],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()
        }
        .onAppear {
            withAnimation(.easeOut(duration: 5)) {
                progress = 1
            }
        }
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text("ANDREA")
                    .font(.system(.title, design: .serif, weight: .heavy))
                Text("3100 Mile Race")
                    .font(.system(.title, design: .serif, weight: .light))
            }
            .kerning(3)
            Spacer()
            Image(systemName: "trophy.fill")
                .font(.largeTitle)
                .foregroundStyle(.orange)
                .shadow(color: .purple, radius: 5)
        }
    }

    private var ring: some View {
        ZStack {
            Circle()
                .stroke(.white.opacity(0.15), lineWidth: 6)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(ringGradient, style: StrokeStyle(lineWidth: 14, lineCap: .round))
                .rotationEffect(.degrees(-90))
            Image(.winner)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150) 
                .clipShape(.circle)
        }
        .frame(width: 220, height: 220)
    }
}

struct StatCard: View {
    let symbol: String
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: symbol)
                .font(.title2)
                .foregroundStyle(.orange)
            Text(value)
                .font(.system(.title, design: .rounded, weight: .bold))
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
    }
}

#Preview {
    ClaudeView()
}


