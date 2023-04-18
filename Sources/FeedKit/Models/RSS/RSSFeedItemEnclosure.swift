//
//  RSSFeedItemEnclosure.swift
//
//  Copyright (c) 2016 - 2018 Nuno Manuel Dias
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

/// Describes a media object that is attached to the item.
/// 
/// <enclosure> is an optional sub-element of <item>.
/// 
/// It has three required attributes. url says where the enclosure is located,
/// length says how big it is in bytes, and type says what its type is, a
/// standard MIME type.
/// 
/// The url must be an http url.
/// 
/// <enclosure url="http://www.scripting.com/mp3s/weatherReportSuite.mp3" 
/// length="12216320" type="audio/mpeg" />
public class RSSFeedItemEnclosure {
    
    /// Where the enclosure is located.
    public var url: String?
    
    /// How big the media object is in bytes.
    public var length: Int64?
    
    /// Standard MIME type.
    public var type: String?
    
    public init() { }
    
    public init?(dictionary: [String: Any]) {
        if let url = dictionary["url"] as? String {
            self.url = url
        } else if let enclosure = dictionary["enclosure"] as? String {
            self.url = enclosure
        } else {
            return nil
        }
        
        if let length = dictionary["length"] as? Int64 {
            self.length = length
        }
        
        if let type = dictionary["type"] as? String {
            self.type = type
        }
    }
    
    public var dictionary: [String: Any] {
        var dictionary = [String: Any]()
        if let url = url {
            dictionary["url"] = url
        }
        if let length = length {
            dictionary["length"] = length
        }
        if let type = type {
            dictionary["type"] = type
        }
        return dictionary
    }
    
}

// MARK: - Equatable

extension RSSFeedItemEnclosure: Equatable {
    
    public static func ==(lhs: RSSFeedItemEnclosure, rhs: RSSFeedItemEnclosure) -> Bool {
        return
            lhs.url == rhs.url &&
            lhs.length == rhs.length &&
            lhs.type == rhs.type
    }
    
}
