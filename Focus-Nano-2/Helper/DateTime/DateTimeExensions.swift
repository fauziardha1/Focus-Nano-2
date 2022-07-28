//
//  DateTimeExensions.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
     func getDayStr() -> String {
        var result = ""
        if self.get(.day) == Date.now.get(.day){
            result = "Today"
        }
        else if (self.get(.day) - Date.now.get(.day)) == 1 {
            result = "Tomorrow"
        }
        else {
            result = self.getMonthStr() + " " + String(self.get(.day))
        }
        return result
    }
    
    func getMonthStr() -> String {
        var month = ""
        switch self.get(.month){
        case 1 :
            month = "Jan"
        case 2 :
            month = "Feb"
        case 3 :
            month = "Mar"
        case 4 :
            month = "Apr"
        case 5 :
            month = "May"
        case 6 :
            month = "Jun"
        case 7 :
            month = "Jul"
        case 8 :
            month = "Aug"
        case 9 :
            month = "Sep"
        case 10 :
            month = "Oct"
        case 11 :
            month = "Nov"
            
        default:
            month = "Dec"
        }
        
        return month
    }
    
    func getTimeStr() -> String {
        
        var hour = String(self.get(.hour))
        var minutes = String(self.get(.minute))
        
        var timeSuffix = " AM"
        if  Int(self.get(.hour) / 12) == 1{
            timeSuffix = " PM"
        }
        
        if timeSuffix == " PM"{
            hour = self.get(.hour) >= 12
            ?  String(self.get(.hour) - 12)
            :  String(self.get(.hour))
        }
        
        if self.get(.hour) == 24 {
            timeSuffix = " AM"
            hour = String(self.get(.hour) - 12)
        }
        
        hour = hour.count == 1 ? "0" + hour : hour
        minutes = minutes.count == 1 ? "0" + minutes : minutes
        
        return hour + ":" + minutes + timeSuffix
    }
}


extension Int {
    func secondsToMinuteAndSecond() -> String {
       let minutes : Int = self / 60
       let seconds : Int = self % 60
       let minutesStr : String = String(minutes).count == 1 ? "0"+String(minutes) : String(minutes)
       let secondsStr : String = String(seconds).count == 1 ? "0"+String(seconds) : String(seconds)
       return "\(minutesStr):\(secondsStr)"
   }
}
