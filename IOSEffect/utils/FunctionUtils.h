//
//  FunctionUtils.h
//  styler
//
//  Created by 冯聪智 on 14-9-19.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FunctionUtils : NSObject

+(void)setTimeout:(void (^)())block delayTime:(float)delayTime;


+ (NSString *)getChineseNum:(int)num;

+ (NSString *)getChineseNumByBool:(int)num;

+ (CGSize)getCGSizeByString:(NSString *)string font:(CGFloat)font;
+ (int)getRowNum:(int)totalNum divisor:(int)divisor;


+ (NSString *)getEnNumByChinese:(NSString *)chinese;

+ (NSInteger)getLottery:(int)price array:(NSMutableArray *)array;
+(CGSize) boundingALLRectWithSize:(NSString*) txt Font:(UIFont*) font Size:(CGSize) size;

@end
