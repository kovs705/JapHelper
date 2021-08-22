//
//  ContentView.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

import SwiftUI
import CoreData
import Combine
import UIKit

// MARK: - Instructions
    ///
    /// Right now (06.08.2021) I'm working on notification on top of the app, specifically working on timer for it.
    ///
    ///
    ///
//


// MARK: - ContentView struct
struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    
    @EnvironmentObject var userData: UserData
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @State private var visible: Bool = false
    @State var attentionText: String = "There is a bug!"
    @State private var notificationIsActive: Bool = false
    @State private var timeRemaining: Int = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var keyboardHeight: CGFloat = 0
    @State var groupName: String = ""
    
    @State private var buttonState: Bool = false
    
    
    // MARK: - Functions

    func add() {
        if groupName.count <= 3 {
            // print("Type more than 3 letters")
            attentionText = "Type more than 3 letters"
            visible.toggle()
            // set timer for 3 seconds to show attention bar on top
        } else {
            let newGroup = Group(context: self.viewContext)
            newGroup.name = self.groupName
            do {
                try self.viewContext.save()
                visible = false
            } catch {
                attentionText = "Error in saving a group"
                // print("Error in saving group")
                notificationIsActive = true
            }
        }
    }
    
    func deleteGroup(at offsets: IndexSet) {
        for index in offsets {
            let group = groups[index]
            viewContext.delete(group)
        }
        do {
            try self.viewContext.save()
        } catch {
            attentionText = "Something happened on deleting the group!"
            print("Something happened on deleting the group!")
            notificationIsActive = true
        }
    }
    
    func changeToggle() {
        buttonState.toggle()
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        // Vstack with RoundedRectangles:
                        VStack {
                            HStack {
                                NavigationLink(destination: lessonsList()
                                                .environmentObject(UserData()),
                                               label: {
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 25)
                                                        .fill(Color.red)
                                                        .frame(width: 210, height: 230)
                                                        .padding(10)
                                                    Image(systemName: "books.vertical")
                                                        .font(.system(size: 75))
                                                        .foregroundColor(.white)
                                                }
                                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                               })
                                    .buttonStyle(AnimatedButton())
                                // MARK: - Rectangles
                                VStack {
                                    // upper rectangles:
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width: 100, height: 100)
                                            .padding(.vertical, 5)
                                        Image(systemName: "camera")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                    }
                                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                    
                                    // black lower rectangle
                                    NavigationLink(destination: ListOfGroups(), label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.black)
                                                .frame(width: 100, height: 100)
                                            Image(systemName: "list.bullet.below.rectangle")
                                                .font(.system(size: 40))
                                                .foregroundColor(.white)
                                        }
                                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                    })
                                    .buttonStyle(AnimatedButton())
                                }
                                // end of NavLink
                            }
                            
                        }
                        
                        // end of rectangles
                        
                        // MARK: - Vocabulary
                        VStack {
                            HStack {
                                Text("Vocabulary")
                                    .font(.system(size: 23))
                                    .bold()
                                    .frame(height: 50)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            if visible {
                            
                                // ФОКУСИРОВКА НА КЛАВИАТУРУ И ИЗМЕНЕНИЕ ЦВЕТА КНОПКУ ДОБАВЛЕНИЯ ГРУППЫ
                                ZStack {
                                    // MARK: - Keyboard
                                TextField("Group name..", text: $groupName, onCommit: {
                                    add()
                                })
                                
                                .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .opacity))
                                .frame(width: UIScreen.main.bounds.width - 80, height: 55)
                                .contentShape(Rectangle())
                                .padding(.horizontal)
                                .background(Color.white)
                                .cornerRadius(20)
                                
                                .lineLimit(1)
                                .scaleEffect(self.buttonState ? 0.95 : 1.0)
                                
                                .font(.system(size: 18))
                                /*
                                .onLongPressGesture(minimumDuration: 2.5, maximumDistance: 0.1, pressing: { pressing in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        self.buttonState = pressing
                                    }
                                }, perform: {})
                                */
                                
                                .animation(.easeInOut)
                                
                                // .padding(.horizontal)
                                .padding(.bottom, keyboardHeight)
                                
                                .onReceive(Publishers.keyboardHeight) {
                                    self.keyboardHeight = $0
                                }
                                
                                .padding(.horizontal)
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .opacity))
                                // .frame(height: 50)
                                // focus keyboard on click
                                }
                                .frame(width: UIScreen.main.bounds.width - 70, height: 60)
                                .zIndex(-1)
                                
                            }
                            
                            // MARK: - List of groups
                            List {
                                ForEach(groups, id: \.self) { group in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.offWhite)
                                        HStack {
                                            Text(group.name ?? "Unknown name")
                                                .font(.headline)
                                        }
                                    }
                                }
                                .onDelete(perform: deleteGroup)
                            }
                            .zIndex(-2)
                            .background(Color.clear)
                            .onAppear {
                                UITableView.appearance().isScrollEnabled = false
                            }
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 450) // 360
                            // .border(Color.red)
                        }
                    }
                    // end of VStack
                }
                // end of ScrollView
                
                // MARK: - Attention notification
                VStack {
                    // floating error message when user works with the TextField for creating a group:
                    if notificationIsActive {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                            .frame(width:UIScreen.main.bounds.width - 65, height: 55)
                        
                        HStack {
                            // Two textes with attention
                            Text("Attention!")
                                .font(.system(.subheadline))
                                .bold()
                            // Spacer()
                            Text("\(attentionText)")
                                .font(.system(.caption2))
                                .lineLimit(2)
                        }
                        .frame(width:UIScreen.main.bounds.width - 80, height: 55)
                    }
                    .padding(.horizontal)
                    .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .move(edge: .bottom).combined(with: .opacity)))
                    .animation(.easeInOut)
                    .frame(width:UIScreen.main.bounds.width - 65, height: 55)
                    
                    .onReceive(timer) { time in
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                        }
                        if self.timeRemaining == 0 {
                            notificationIsActive = false
                        }
                    }
                    }
                    
                    // MARK: - Floating Button
                    
                    Spacer()
                    HStack {
                        Spacer()
                        if !visible {
                            AddGroupButton(visible: $visible)
                                .buttonStyle(AnimatedButton())
                        } else {
                            Button(action: add) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.redColor)
                                    HStack {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                        Text("Add group")
                                            .foregroundColor(.white)
                                            .bold()
                                            .lineLimit(0)
                                    }
                                }
                                .frame(width: 140, height: 45)
                            }
                            .buttonStyle(AnimatedButton())
                        }
                    }
                }
                .padding()
                .navigationTitle("Japanese")
            }
            // end of ZStack
            // .keyboardAdaptive()
        }
        //.keyboardAdaptive()
        // end of NavView
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(UserData())
    }
}


// MARK: - Extensions

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }

    private static weak var _currentFirstResponder: UIResponder?

    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }

    var globalFrame: CGRect? {
        guard let view = self as? UIView else { return nil }
        return view.superview?.convert(view.frame, to: nil)
    }
}

struct KeyboardAdaptive: ViewModifier {
    @State private var bottomPadding: CGFloat = 0
    
    func body(content: Content) -> some View {
        
        GeometryReader { geometry in
            content
                .padding(.bottom, self.bottomPadding)
                
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    
                    self.bottomPadding = max(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.bottom)
            }
                
            .animation(.easeOut(duration: 0.16))
        }
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}
extension View {
    func banner(data: Binding<BannerModifier.BannerData>, show: Binding<Bool>) -> some View {
        self.modifier(BannerModifier(data: data, show: show))
    }
}
