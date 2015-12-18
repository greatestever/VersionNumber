//
//  main.swift
//  VersionNumber
//
//  Created by ZACH on 12/17/15.
//  Copyright © 2015 ZACH. All rights reserved.
//

import Foundation

func maxVersion(version1: String, version2: String) -> String
{
    // Separate versions at periods
    var lhs = version1.componentsSeparatedByString(".")
    var rhs = version2.componentsSeparatedByString(".")
    
    for(var i = 0; i < lhs.count || i < rhs.count; i++)
    {
        // If both have a index compare which is higher or continue if they are the same
        if(i < lhs.count && i < rhs.count)
        {
            if(Int(lhs[i]) > Int(rhs[i]))
            {
                return version1
            }
            else if(Int(lhs[i]) < Int(rhs[i]))
            {
                return version2
            }
        }
        else if(i < lhs.count)
        {
            // If lhs has index and is greater than 0 then return version1
            if(Int(lhs[i]) > 0)
            {
                return version1
            }
        }
        else
        {
            // If rhs has index and is greater than 0 then return version2
            if(Int(rhs[i]) > 0)
            {
                return version2
            }
        }
    }
    // Versions are equal so return either version1 or version2
    return version1
}

if let path = NSBundle.mainBundle().pathForResource("versions", ofType: "txt")
{
    // File does exist
    var data = ""
    
    do
    {
        // Parse text file into string
        data = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
    }
    catch
    {
        // Catch exception
        print(error)
    }
    
    if (data.characters.count > 0)
    {
        // Separate versions into their own index
        let separators = NSCharacterSet(charactersInString: ";\n")
        var array = data.componentsSeparatedByCharactersInSet(separators)
        var max = "0"
        
        // Remove empty strings
        for (var i = 0; i < array.count; i++)
        {
            if (array[i] == "")
            {
                array.removeAtIndex(i)
            }
        }
        
        // Find max version
        for (var i = 0; i < array.count; i++)
        {
            max = maxVersion(array[i], version2: max)
        }
        print(max)
    }
    else
    {
        // File is empty
        print("The file contains no contents.")
    }
}
else
{
    // File does not exist
    print("File does not exist.")
}

