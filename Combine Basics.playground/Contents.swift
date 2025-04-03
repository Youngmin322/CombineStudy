import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let helloPublisher = Just("안녕하세요")

let helloSubscriber = helloPublisher.sink { value in
    print("Hello, \(value)!")
}

let pizzaToppings = ["Pepperoni", "Mushrooms", "Onions",
                     "Salami", "Bacon", "Extra cheese",
                     "Black olives", "Green peppers"].publisher

pizzaToppings.sink { topping in
    print("\(topping) is a popular topping for pizza")
}

// CurrentValueSubject: 현재 값을 저장하고, 새 구독자에게 즉시 현재 값을 전달
// <값 타입, 에러 타입> - Never는 에러가 발생하지 않음을 의미
let temperatureSubject = CurrentValueSubject<Double, Never>(20.0)
// 온도 값을 구독
let temperatureSubscription = temperatureSubject.sink { temp in
    print("👉 온도: \(temp)°C")
}

// 새로운 값 발행
print("온도를 변경합니다...")
temperatureSubject.send(22.5)
temperatureSubject.send(25.0)

print("현재 저장된 온도: \(temperatureSubject.value)°C")

