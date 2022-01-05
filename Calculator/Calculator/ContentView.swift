import SwiftUI

struct Calculator: View {
    
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var operand = ""
    @State private var calculatorText = "0"
    @State private var isTypingNumber = false
    
    var body: some View {
        VStack(spacing: 30) {
            // 1.
            TextField("0", text: $calculatorText)
                .border(Color.gray, width: 2)
                .padding()
                .multilineTextAlignment(.trailing)
            
            HStack {
                // 2.
                createCalcDigit("1")
                Spacer()
                createCalcDigit("2")
                Spacer()
                createCalcDigit("3")
            }.padding()
            
            HStack {
                createCalcDigit("4")
                Spacer()
                createCalcDigit("5")
                Spacer()
                createCalcDigit("6")
            }.padding()
            
            HStack {
                createCalcDigit("7")
                Spacer()
                createCalcDigit("8")
                Spacer()
                createCalcDigit("9")
            }.padding()
            
            HStack {
                // 3.
                Button(action: {
                    self.operandTapped("-")
                }) {
                    (Text("-"))
                }
                Spacer()
                createCalcDigit("0")
                Spacer()
                Button(action: {
                    self.operandTapped("+")
                }) {
                    (Text("+"))
                }
                
            }.padding()
            
            HStack {
                Spacer()
                // 4.
                Button(action: {
                    self.calculate()
                }) {
                    (Text("="))
                }
                Spacer()
            }
        }
        .font(.largeTitle)
    }
        private func createCalcDigit(_ number: String) -> Button<Text> {
            return Button(action: {
                self.digitTapped(number)
            }) {
                (Text(number))
            }
        }
        
        // 2.
        private func digitTapped(_ number: String) -> Void {
            if isTypingNumber {
                calculatorText += number
            } else {
                calculatorText = number
                isTypingNumber = true
            }
        }
        
        // 3.
        private func operandTapped(_ operand: String) {
            isTypingNumber = false
            firstNumber = Int(calculatorText)!
            self.operand = operand
        }
        
        // 4.
        private func calculate() {
            isTypingNumber = false
            var result  = 0
            secondNumber = Int(calculatorText)!
            
            if operand == "+" {
                result = firstNumber + secondNumber
            } else if operand == "-" {
                result = firstNumber - secondNumber
            }
            
            calculatorText = "\(result)"
        }
        
    
}

struct PreView: PreviewProvider {
    static var previews: some View {
        Calculator()
    }
}
