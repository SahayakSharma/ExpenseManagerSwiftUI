//
//  CustomTextInput.swift
//  ExpenseTrackerSwiftProject
//
//  Created by Sahayak Sharma on 29/10/25.
//

import SwiftUI

struct CustomTextInput: View {
    
    @Binding var textBoundToInputField: String
    var placeholderString:String
    var isSecure:Bool = false
    
    var body: some View {
        VStack {
            if isSecure{
                SecureField(placeholderString,text: $textBoundToInputField)
            }
            else{
                TextField(placeholderString,text: $textBoundToInputField)
            }
            
            Divider()
        }
    }
}
