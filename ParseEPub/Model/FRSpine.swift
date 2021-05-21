//
//  FRSpine.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/28.
//

import UIKit

struct Spine {
    var linear: Bool
    var resource: FRResource

    init(resource: FRResource, linear: Bool = true) {
        self.resource = resource
        self.linear = linear
    }
}

class FRSpine: NSObject {
    var pageProgressionDirection: String?
    var spineReferences = [Spine]()

    var isRtl: Bool {
        if let pageProgressionDirection = pageProgressionDirection , pageProgressionDirection == "rtl" {
            return true
        }
        return false
    }

    func nextChapter(_ href: String) -> FRResource? {
        var found = false;

        for item in spineReferences {
            if(found){
                return item.resource
            }

            if(item.resource.href == href) {
                found = true
            }
        }
        return nil
    }
}
