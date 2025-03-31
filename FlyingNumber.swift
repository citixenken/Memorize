//
//  FlyingNumber.swift
//  Memorize
//
//  Created by Ken Muyesu on 31/03/2025.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
