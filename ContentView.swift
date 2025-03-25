//
//  ContentView.swift
//  TimeTravelTest
//
//  Created by cmStudent on 2025/03/26.
//

// 李　宰赫　り　さいかく
import SwiftUI

struct ContentView: View {
    @StateObject var vm = TimeViewModel()
    
    var body: some View {
        HStack {
            Text("指定時刻")
            TextField("時間を入力",text:$vm.inputHour)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width:150)
                .keyboardType(.numberPad)
                .onChange(of: vm.inputHour) {
                    vm.showResult = false
                }
            Button("検索") {
                vm.checkRange()
            }
        }
        .padding(.bottom)
        
        HStack {
            VStack {
                Text("開始時刻\(vm.startHour)時")
                Picker("",selection:$vm.startHour) {
                    ForEach(vm.hours, id: \.self) { num in
                        Text("\(num)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width:100,height:100)
                .onChange(of: vm.startHour) {
                    vm.showResult = false
                }
            }
            VStack {
                Text("終了時刻\(vm.endHour)時")
                Picker("",selection:$vm.endHour) {
                    ForEach(vm.hours, id: \.self) { num in
                        Text("\(num)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width:100,height:100)
                .onChange(of: vm.endHour) {
                    vm.showResult = false
                }
            }
        }
        if vm.showResult {
            Text(vm.result)
                .foregroundColor(vm.isRange ? .green : .red)
        }
    }
}

#Preview {
    ContentView()
}
