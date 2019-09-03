//
//  NSObject+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/28.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "NSObject+LJKit.h"

@implementation NSObject (LJKit)
+ (NSDictionary *)lj_ivarList:(NSObject *)object {
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
    unsigned  int count = 0;
    Ivar *ivarList = class_copyIvarList([object class], &count);
    for (int i = 0; i < count; i++){
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        const char *ivarType = ivar_getTypeEncoding(ivar);
        [tempDict setValue:[NSString stringWithUTF8String:ivarType] forKey:[NSString stringWithUTF8String:ivarName]];
        NSLog(@"ivarName = %s, ivarType = %s", ivarName, ivarType);
    }
    return [NSDictionary dictionaryWithDictionary:tempDict];
}

+ (void)lj_methods:(NSObject *)object {
//    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
    unsigned int count = 0;
    Method *mets = class_copyMethodList([object class], &count);
    for(int i=0;i<count;i++){
        NSString *str = [NSString stringWithCString:method_getTypeEncoding(mets[i]) encoding:NSUTF8StringEncoding];
        SEL sel = method_getName(mets[i]);
        NSString *name = [NSString stringWithCString:sel_getName(sel) encoding:NSUTF8StringEncoding];
        
        NSLog(@"方法名：%@\n属性：%@",name,str);
    }
}
@end
