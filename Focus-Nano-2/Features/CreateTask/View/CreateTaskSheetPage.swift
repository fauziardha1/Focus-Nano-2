//
//  CreateTaskSheetPage.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 26/07/22.
//

import Foundation
import SwiftUI


struct CreateTaskSheetPage : View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var createTaskViewModel : CreateTaskViewModel
    @ObservedObject  var datePickerModel = DueDatePikerModel()
    
    @State private var isDatePickerToggled = false
    @State private var isTimePickerToggled = false
    
    init(vm: CreateTaskViewModel){
        self.createTaskViewModel = vm
    }
    
    // for date picker
    @State private var dueDate = Date()
    
    var body: some View{
        ZStack{
            Color.gray.opacity(0.2)
            
            GeometryReader{
                g in
                VStack(alignment: .leading) {
                    // Navbar Top
                    CraeateTaskSheetNavbarTop(g: g, createTaskViewModel: createTaskViewModel)
                    
                    Text("Task Title")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                    
                    // task title text field
                    TextField("Task's Title", text: $createTaskViewModel.title)
                        .textFieldStyle(CustomTextFieldStyle())
                        .frame(width: g.size.width - 32, height: 50, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Text("Due Date")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                    
                    // Date picker
                    DueDatePicker(g: g,  isTimePickerToggled: $isTimePickerToggled, isDatePickerToggled: $isDatePickerToggled,  datePickerModel: datePickerModel, createTaskViewModel: createTaskViewModel)
                    
                    // time picker
                    TimePicker(g: g,  isTimePickerToggled: $isTimePickerToggled, isDatePickerToggled: $isDatePickerToggled, datePickerModel: datePickerModel, createTaskViewModel: createTaskViewModel)
                    
                    
                        
                }
            }
        }
    }
}


struct CreateTaskSheetPage_Preview : PreviewProvider{
    static var previews: some View{
        let viewContext = CoreDataManager.shared.persistanceContainer.viewContext
        CreateTaskSheetPage(vm: CreateTaskViewModel(context: viewContext))
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}






