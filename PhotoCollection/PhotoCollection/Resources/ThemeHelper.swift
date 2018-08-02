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
        if themePreference == nil{
            setThemePreferenceToDark()
        }
    }
    
    //Don't fully understand userDefaults. What is up with that?
    func setThemePreferenceToDark(){
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight(){
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    

    //MARK: - Properties
    var themePreferenceKey: String = "themePreference"
    
    
    var themePreference: String? {
        //let userDefaults = UserDefaults.standard
        //guard let key = themePreferenceKey else {return ""}
        //return userDefaults.string(forKey: key)
        
        return UserDefaults.standard.string(forKey: themePreferenceKey)
        
    }
    
    
    
}
