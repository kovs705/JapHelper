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
    enum BannerTitle {
        case Info
            case Warning
                case Success
                    case Error
        
        var caseString: String {
            switch self {
            case .Info:
                return String("Need to know") // in blue
            case .Warning:
                return String("Attention!") // in yellow
            case .Success:
                return String("Successful") // in green
            case .Error:
                return String("Error!") // in red
            }
        }
        
    }
    enum BannerDetail {
        case Info
            case Warning
                case Success
                    case Error
        
        var caseDetail: String {
            switch self {
            case .Info:
                return String("")
            case .Warning:
                return String("")
            case .Success:
                return String("")
            case .Error:
                return String("")
            }
        }
    }
    
    struct BannerData {
        // var title: String
        var title: BannerTitle
        var detail: BannerDetail
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
                            Text(data.title.caseString)
                                .bold()
                            Text(data.detail.caseDetail)
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

