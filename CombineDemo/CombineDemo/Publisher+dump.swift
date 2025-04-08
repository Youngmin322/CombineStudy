//
//  Publisher+dump.swift
//  CombineDemo
//
//  Created by 조영민 on 4/8/25.
//

import Combine

extension Publisher {
    func dump() -> AnyPublisher<Self.Output, Self.Failure> {
        handleEvents(receiveSubscription: { value in
            Swift.dump(value)
        })
        .eraseToAnyPublisher()
    }
}
