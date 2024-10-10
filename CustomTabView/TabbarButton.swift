//
//  TabbarButton.swift
//  CustomTabView
//
//  Created by Merve Sena on 7.10.2024.
//

import SwiftUI

struct TabbarButton: View {
    public var image : String
    public var selectedTabbar : String
    public var reader : GeometryProxy
    public var xOffset : CGFloat = 0
    let action : () -> Void
    
    var body: some View {
        Button(action : action) {
            ZStack {
                Circle()
                    .fill(selectedTabbar == image ? Color(red: 95/255 , green: 111/255 , blue: 101/255) : Color(red: 201/255 , green: 218/255 , blue: 191/255))
                    .frame(width: selectedTabbar == image ? 67 : 55, height: selectedTabbar == image ? 67 : 55)
                    .offset(y : selectedTabbar == image ? -30 : 0)
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .foregroundStyle(selectedTabbar == image ? Color(red: 156/255 , green: 169/255 , blue: 134/255) : .white)
                    .padding(selectedTabbar == image ? 15 : 0)
                    .background(Color.white.opacity(selectedTabbar == image ? 1 : 0).clipShape(Circle()))
                    .offset(y : selectedTabbar == image ? -30 : 0)
            }
        }
    }
}

