//
//  FireworkRing.swift
//  challenges
//
//  Created by Gurudev on 25.10.2026.
//

import SwiftUI

// One firework: where it is and how it looks
struct Burst: Identifiable {
    let id = UUID()
    let point: CGPoint      // position relative to the ring's center
    let color: Color
    let distance: CGFloat   // how far the sparks fly
}

// One explosion: sparks fly out in a circle and fade away
struct FireworkBurst: View {
    let color: Color
    let distance: CGFloat
    private let sparkCount = 24
    @State private var exploded = false

    var body: some View {
        ZStack {
            ForEach(0..<sparkCount, id: \.self) { i in
                let angle = Double(i) / Double(sparkCount) * 2 * .pi
                Circle()
                    .fill(color)
                    .frame(width: 5, height: 5)
                    .scaleEffect(exploded ? 0.3 : 1)
                    .offset(x: exploded ? cos(angle) * distance : 0,
                            y: exploded ? sin(angle) * distance : 0)
            }
        }
        .opacity(exploded ? 0 : 1)
        .shadow(color: color, radius: 4)          // glow ✨
        .onAppear {
            withAnimation(.easeOut(duration: 3.5)) { exploded = true }
        }
    }
}

// The ring with fireworks following its tip
struct FireworkRing: View {
    @State private var progress = 0.0
    @State private var bursts: [Burst] = []

    private let size: CGFloat = 220
    private let colors: [Color] = [.orange, .pink, .purple, .yellow, .cyan]
    private let ringGradient = AngularGradient(colors: [.orange, .pink, .purple, .orange],
                                               center: .center)

    var body: some View {
        ZStack {
            Circle()
                .stroke(.white.opacity(0.1), lineWidth: 3)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(ringGradient, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .rotationEffect(.degrees(-90))

            Image(.winner)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(.circle)

            ForEach(bursts) { burst in
                FireworkBurst(color: burst.color, distance: burst.distance)
                    .offset(x: burst.point.x, y: burst.point.y)
            }
        }
        .frame(width: size, height: size)
        .task { await launch() }
    }

    // fraction 0 = top (12 o'clock), 0.5 = bottom, 1 = top again
    private func pointOnRing(_ fraction: Double) -> CGPoint {
        let angle = fraction * 2 * .pi - .pi / 2
        let radius = size / 2
        return CGPoint(x: cos(angle) * radius, y: sin(angle) * radius)
    }

    private func launch() async {
        let duration = 2.0
        let steps = 10

        // linear = the tip moves at constant speed, so we know where it is
        withAnimation(.linear(duration: duration)) { progress = 1 }

        // small bursts following the tip
        for step in 1...steps {
            try? await Task.sleep(for: .seconds(duration / Double(steps)))
            let fraction = Double(step) / Double(steps)
            bursts.append(Burst(point: pointOnRing(fraction),
                                color: colors[step % colors.count],
                                distance: 25))
        }

        // grand finale 🎆
        for color in colors {
            bursts.append(Burst(point: pointOnRing(.random(in: 0...1)),
                                color: color,
                                distance: 30))
            try? await Task.sleep(for: .seconds(5))
        }
    }
}

#Preview {
    FireworkRing()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.02925465629, green: 0.01754577458, blue: 0.1250821352, alpha: 1)))
}

