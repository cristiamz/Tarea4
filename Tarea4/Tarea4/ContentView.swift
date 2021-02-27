//
//  ContentView.swift
//  Tarea4
//
//  Created by Cristian Zuniga on 27/2/21.
//

import SwiftUI

enum CalculatorButtons: String{
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide, period
    case ac,plusMinus, percent, equal
    
    var backgroundColor: Color {
        switch self {
        case .zero, .period,.one,.two,.three,.four,.five,.six,.seven,.eight,.nine: return Color(.darkGray)
        case .ac,.plusMinus,.percent: return Color(.lightGray)
        default:
            return Color(.orange)
         }
    }
    
    var buttonHeight:CGFloat{
            return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    var buttonWidth :CGFloat{
        switch self {
        case .zero:
            return (UIScreen.main.bounds.width - 4 * 12) / 2
        default:
            return (UIScreen.main.bounds.width - 5 * 12) / 4
         }
    }
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine : return "9"
        case .period : return "."
        case .ac   : return "AC"
        case .plusMinus : return "+/-"
        case .percent : return "%"
        case .divide : return "÷"
        case .multiply : return "X"
        case .plus : return "+"
        case .minus : return "-"
        case .equal : return "="
        default:
            return ""
        }
    }
}

struct ContentView: View {
    
    let buttons: [[CalculatorButtons]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .period, .equal],
    ]
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12){
                HStack{
                    Spacer()
                    Text("0").foregroundColor(.white)
                        .font(.system(size:72))
                }.padding()
                
                ForEach (buttons, id: \.self){
                    row in
                    HStack (spacing: 12){
                        ForEach(row, id: \.self)
                        { button in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                 Text(button.title)
                                .font(.system(size:32))
                                    .frame(width:button.buttonWidth, height:button.buttonHeight)
                                .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                .cornerRadius(button.buttonWidth)
                            })
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
