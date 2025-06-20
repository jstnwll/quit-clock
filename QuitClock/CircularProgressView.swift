//
//  CircularProgressView.swift
//  QuitClock
//
//  Created by Justin Willemsen on 6/19/25.
//

import SwiftUI

struct CircularProgressView: View {
    let color: Color
    let progress: Double
    let milestone: String

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.1),
                    lineWidth: 5
                )
                .frame(maxWidth: 75, maxHeight: 75)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .frame(maxWidth: 75, maxHeight: 75)
            Text(milestone)
                .font(.callout)
                .bold()
        }
    }
}

#Preview {
    CircularProgressView(color: .red, progress: 0.75, milestone: "3 yrs")
}
