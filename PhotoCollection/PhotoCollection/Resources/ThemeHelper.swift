//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Andrew Liao on 8/2/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    
    init() {
        if themePreferenceKey == nil{
            setThemePreferenceToLight()
        }
    }
    
    //Don't fully understand userDefaults. What is up with that?
    func setThemePreferenceToDark(){
        let userDefaults = UserDefaults.standard
         guard let key = themePreferenceKey else {return}
        userDefaults.set("Dark", forKey: key)
    }
    
    func setThemePreferenceToLight(){
        let userDefaults = UserDefaults.standard
        guard let key = themePreferenceKey else {return}
        userDefaults.set("Light", forKey: key)
    }
    
    
    //MARK: - Properties
    var themePreferenceKey: String?
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        guard let key = themePreferenceKey else {return ""}
        return userDefaults.string(forKey: key)
        
    }
    
    
    
}
