//
//  ContentView.swift
//  Calculator
//
//  Created by Rafał on 09/10/2023.
//

import SwiftUI

struct CalculatorButton: View {
    @State var text = "myButton"
    @State var width = 100.0
    @State var height = 60.0
    @State var action: () -> Void
    
    var body: some View {
        Button(text, action: action)
            .font(.title)
            .padding(16)
            .frame(width: width, height: height)
            .border(Color.black, width: 2)
    }
}

struct ContentView: View {
    @State var resultText = ""
    @State var numbers: [String] = []
    @State var currentNum = 0
    @State var operation: String? = nil
    @State var isAlertShown: Bool = false
    
    func addDigit(a: String) {
        if numbers.count == 0 {
            resultText = ""
        }
        if operation == "sin" && currentNum == 1 {
            return
        }
        if numbers.count == 0 || currentNum == 1 && numbers.count == 1 {
            numbers.append(a)
        } else {
            numbers[currentNum].append(a)
        }
        resultText.append(a)
    }
    
    func setOperation(op: String) {
        guard numbers.count > 0 else {
            return
        }
        currentNum = 1
        resultText = ""
        operation = op
    }
    
    var body: some View {
        VStack {
            Text(resultText)
                .font(.title)
                .frame(width: 315, height: 60)
                .border(Color.black, width: 2)
            HStack {
                CalculatorButton(text: "1", action: {addDigit(a: "1")})
                CalculatorButton(text: "2", action: {addDigit(a: "2")})
                CalculatorButton(text: "3", action: {addDigit(a: "3")})
            }
            HStack {
                CalculatorButton(text: "4", action: {addDigit(a: "4")})
                CalculatorButton(text: "5", action: {addDigit(a: "5")})
                CalculatorButton(text: "6", action: {addDigit(a: "6")})
            }
            HStack {
                CalculatorButton(text: "7", action: {addDigit(a: "7")})
                CalculatorButton(text: "8", action: {addDigit(a: "8")})
                CalculatorButton(text: "9", action: {addDigit(a: "9")})
            }
            HStack {
                CalculatorButton(text: "0", action: {addDigit(a: "0")})
                CalculatorButton(text: "+", action: {setOperation(op: "+")})
                CalculatorButton(text: "-", action: {setOperation(op: "-")})
            }
            HStack {
                CalculatorButton(text: "*", action: {setOperation(op: "*")})
                CalculatorButton(text: "/", action: {setOperation(op: "/")})
                CalculatorButton(text: "sin", action: {setOperation(op: "sin")})
            }
            CalculatorButton(text: "Oblicz", width: 315, height: 60, action: {
                if operation == nil {
                    return
                }
                guard let num1 = Int(numbers[0]) else {
                    print("Sth went wrong 0")
                    return
                }
                if operation == "sin" {
                    resultText = String(MathService.calc_sin(a: num1))
                } else {
                    guard let num2 = Int(numbers[1]) else {
                        print("Sth went wrong 1")
                        return
                    }
                    switch operation {
                    case "+":
                        resultText = String(MathService.add(a: num1, b: num2))
                    case "-":
                        resultText =  String(MathService.subtract(a: num1, b: num2))
                    case "*":
                        resultText =  String(MathService.multiply(a: num1, b: num2))
                    case "/":
                        let result = MathService.divide(a: num1, b: num2)
                        guard result != nil else {
                            isAlertShown.toggle()
                            numbers[1] = ""
                            resultText = ""
                            return
                        }
                        resultText = String(result!)
                    default:
                        print("Sth went wrong 3")
                    }
                }
                numbers.removeAll()
                operation = nil
                currentNum = 0
            })
        }
        .padding()
        .alert("Cannot divide by zero", isPresented: $isAlertShown) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    ContentView()
}
