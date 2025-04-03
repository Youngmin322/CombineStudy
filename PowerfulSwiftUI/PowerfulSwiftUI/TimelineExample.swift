//
//  TimelineExample.swift
//  PowerfulSwiftUI
//
//  Created by 조영민 on 4/3/25.
//

import SwiftUI

struct TimelineExample: View {
    var body: some View {
        TimelineView(.animation) { timeline in
            // 캔버스 뷰를 사용하여 애니메이션을 적용 가능
            // 뷰 컨텍스트는 타임라인에 따라 업데이트
            Canvas { context, size in
                let timeInterval = timeline.date.timeIntervalSince1970
                let seconds = timeInterval.truncatingRemainder(dividingBy: 60)
                let angle = Angle.degrees(seconds * 6)
                
                context.translateBy(x: size.width / 2, y: size.height / 2)
                context.rotate(by: angle)
                
                let rect = CGRect(x: 0, y: 0, width: 5, height: (size.height / 2) - 10)
                context.fill(Path(rect), with: .color(.red))
            }
            .frame(width: 200, height: 200)
            .background(Circle().stroke(Color.black, lineWidth: 2))
            .task {
                print("TimelineView: \(timeline.date)")
            }
        }
    }
}


#Preview {
    TimelineExample()
}
