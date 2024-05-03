//
//  CatFactsViewModel.swift
//  Swift Modular Pattern
//
//  Created by Irinka Datoshvili on 03.05.24.
//

import Foundation
import CatFactsNetworking

class CatFactsViewModel {
    private let networking: CatFactsNetworking
    private(set) var catFacts: [CatFact] = []
    var onDataUpdate: (() -> Void)?
    
    init(networking: CatFactsNetworking = CatFactsNetworking.shared) {
        self.networking = networking
    }
    
    func fetchCatFacts() {
        networking.fetchCatFacts { [weak self] catFacts, error in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching cat facts: \(error.localizedDescription)")
            } else if let catFacts = catFacts {
                self.catFacts = catFacts
                self.onDataUpdate?()
            }
        }
    }
}


