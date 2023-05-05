//
//  MajorityDemoApp.swift
//  MajorityDemo
//
//  Created by Artem Kandaurov on 05.05.2023.
//

import Combine
import Majority
import SwiftUI

@main
struct MajorityDemoApp: App {

    private var bag = Set<AnyCancellable>()

    init() {
        Majority.initialize(apiKey: "899c0f71-4d9d-494f-a0ed-af0e03dbe50c")

        Majority.shared.getAvailableProducts()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print(error)
                    return
                case .finished:
                    return
                }
            } receiveValue: { products in
                print("MAJORITY DEMO: Products: \(products)")
            }
            .store(in: &bag)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
