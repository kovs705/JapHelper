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
                    case ErrorDeleting
                        case ErrorSaving
        
        var tintColor: Color {
            switch self {
            case .Info:
                return Color(red: 67/255, green: 154/255, blue: 215/255) // just a blue
            case .Warning:
                return Color.yellow
            case .Success:
                return Color.green
            case .ErrorDeleting:
                return Color.red
            case .ErrorSaving:
                return Color.red
            }
        }
    }
    enum BannerTitle {
        case Info
            case Warning
                case Success
                    case ErrorDeleting
                        case ErrorSaving
        
        var caseString: String {
            switch self {
            case .Info:
                return String("Need to know") // in blue
            case .Warning:
                return String("Attention!") // in yellow
            case .Success:
                return String("Successful") // in green
            case .ErrorDeleting:
                return String("Error!") // in red
            case .ErrorSaving:
                return String("Error!") // in red
            }
        }
        
    }
    enum BannerDetail {
        case Info
            case Warning
                case Success
                    case ErrorDeleting
                        case ErrorSaving
        
        var caseDetail: String {
            switch self {
            case .Info:
                return String("Something is about to be changed")
            case .Warning:
                return String("Type more than 1 letter")
            case .Success:
                return String("Everything is okay")
            case .ErrorDeleting:
                return String("Something happened on deleting the group!")
            case .ErrorSaving:
                return String("Error in saving a group")
            }
        }
    }
    
    struct BannerData {
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
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(data.type.tintColor)
                                .frame(width: UIScreen.main.bounds.width - 40, height: 70)
                                // .background(data.type.tintColor)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(data.title.caseString)
                                    .bold()
                                Text(data.detail.caseDetail)
                                    .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                                Text("Tap to close")
                                    .font(Font.system(Font.TextStyle.caption))
                            }
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                            // .background(data.type.tintColor)
                            .cornerRadius(10)
                            
                            Spacer()
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 70)
                    // end of HStack
                    // .padding()
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
                .zIndex(2)
                // end of outer VStack
            }
            content
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

