//
//  BannerModifier.swift
//  JapHelper
//
//  Created by Kovs on 20.08.2021.
//

import SwiftUI

struct BannerModifier: ViewModifier {
    
    enum BannerType {
        case Info
            case Warning
                case Success
                    case Error
        
        var tintColor: Color {
            switch self {
            case .Info:
                return Color(red: 67/255, green: 154/255, blue: 215/255) // just a blue
            case .Warning:
                return Color.yellow
            case .Success:
                return Color.green
            case .Error:
                return Color.red
            }
        }
    }
    
    struct BannerData {
        // var title: String
        var detail: String
        var type: BannerType
    }
    @Binding var data: BannerData
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if show {
                VStack {
                    // banner content
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(data.title)
                                .bold()
                            Text(data.detail)
                                .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                        }
                        .foregroundColor(Color.white)
                        .padding(12)
                        .background(data.type.tintColor)
                        .cornerRadius(8)
                        
                        Spacer()
                    }
                    // end of HStack
                    .padding()
                    .animation(.easeInOut)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .onTapGesture {
                        withAnimation {
                            self.show = false
                        }
                    }.onAppear(perform:  {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation {
                                self.show = false
                            }
                        }
                    })
                    
                    Spacer()
                }
                // end of outer VStack
                content
            }
        }
    }
}

/*
struct BannerModifier_Previews: PreviewProvider {
    static var previews: some View {
        BannerModifier()
    }
}
 */

