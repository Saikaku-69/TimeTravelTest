//
//  TimeViewModel.swift
//  TimeTravelTest
//
//  Created by cmStudent on 2025/03/26.
//

import Foundation

class TimeViewModel: ObservableObject {
    let hours: [Int] = Array(0...23)
    
    @Published var targetHour: Int = 0
    @Published var startHour: Int = 0
    @Published var endHour: Int = 0
    @Published var isRange: Bool = false
    @Published var inputHour: String = ""
    @Published var result:String = ""
    @Published var showResult: Bool = false
    
    init() {
        targetHour = Int.random(in: 0...23)
        startHour = hours.first ?? 0
        endHour = hours.first ?? 0
    }
    
    func checkRange() {
        showResult = true
        targetHour = Int(inputHour) ?? -1
        
        if targetHour >= 0 && targetHour < 24 {
            if startHour == endHour {
                isRange = true
                result = "範囲内です"
            } else if startHour < endHour {
                isRange = targetHour >= startHour && targetHour < endHour
                result = isRange ? "範囲内です" : "範囲外です"
            } else {
                isRange = targetHour >= startHour || targetHour < endHour
                result = isRange ? "範囲内です" : "範囲外です"
            }
        } else {
            isRange = false
            result = "指定時間の範囲が正しくありません"
        }
    }
}
