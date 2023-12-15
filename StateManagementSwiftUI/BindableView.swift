//
//  Bindable.swift
//  StateManagementSwiftUI
//
//  Created by Vedat Dokuzkardeş on 10.12.2023.
//

import SwiftUI
import SwiftData


@Observable
class DarkTheme{
    var isEnabled : Bool = false
}

struct DarkChoseView : View {
    
    @Bindable var darkTheme : DarkTheme
    
    var body: some View {
        Toggle(isOn: $darkTheme.isEnabled) {
            EmptyView()
        }.fixedSize()
        }
    }

struct DarkChoiceToggleView :View {
    @Environment(DarkTheme.self) private var darkTheme
    var body: some View {
        DarkChoseView(darkTheme: darkTheme)
    }
}

struct InformationText : View {
    
    @Environment(DarkTheme.self) private var darkTheme
    var body: some View {
        Text(darkTheme.isEnabled ? "Dark Theme" : "White Theme")
            .font(.title)
            .foregroundStyle(darkTheme.isEnabled ? .white : .black)
    }
}


struct BindableView: View {
    
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        VStack{
            DarkChoiceToggleView()
            InformationText()

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(darkTheme.isEnabled ? .black : .white)
    }
}


#Preview {
    BindableView()
        .environment(DarkTheme())
}
