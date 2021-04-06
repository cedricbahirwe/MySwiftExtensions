import UIKit


/// A Fanatic Experiment with Phantom Types
enum Waiting { }
enum CoinInserted { }
enum Fetching { }
enum Serving { }

struct Transition<From, To> {}

struct Machine<State> {
    func transition<To>(with transition: Transition<State, To>) -> Machine<To> {
        .init()
        
    }
}

let start = Transition<Waiting, CoinInserted>()
let selectionMode = Transition<CoinInserted, Fetching>()
let delivery = Transition<Fetching, Serving>()
let reset = Transition<Serving, Waiting>()

let m1 = Machine<Waiting>()

let m2 = m1.transition(with: start)
let m3 = m2.transition(with: selectionMode)
let m4 = m3.transition(with: delivery)
let m5 = m4.transition(with: reset)
let m6 = m5.transition(with: start)
