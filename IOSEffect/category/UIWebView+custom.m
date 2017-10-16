//
//  UIWebView+custom.m
//  Golf
//
//  Created by xubojoy on 2017/3/24.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

#import "UIWebView+custom.h"

@implementation UIWebView (custom)
+ (void)load{
    //  "v@:"
    Class class = NSClassFromString(@"WebActionDisablingCALayerDelegate");
    class_addMethod(class, @selector(setBeingRemoved), setBeingRemoved, "v@:");
    class_addMethod(class, @selector(willBeRemoved), willBeRemoved, "v@:");
    
    class_addMethod(class, @selector(removeFromSuperview), willBeRemoved, "v@:");
}

id setBeingRemoved(id self, SEL selector, ...)
{
    return nil;
}

id willBeRemoved(id self, SEL selector, ...)
{
    return nil;
}
@end
