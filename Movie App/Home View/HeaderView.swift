//
//  HeaderView.swift
//  Movie App
//
//  Created by Monis Manzoor on 03/02/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Welcome Back, Monis")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
          
        }
    }
}

#Preview {
    HeaderView().preferredColorScheme(.dark)
}
