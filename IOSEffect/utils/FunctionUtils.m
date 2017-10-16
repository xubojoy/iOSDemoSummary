//
//  FunctionUtils.m
//  styler
//
//  Created by 冯聪智 on 14-9-19.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import "FunctionUtils.h"

@implementation FunctionUtils


+(void)setTimeout:(void (^)())block delayTime:(float)delayTime{
    [self performSelector:@selector(runBlock:) withObject:block afterDelay:delayTime];
}


+(void) runBlock:(void (^)())block{
    block();
}

+ (NSString *)getChineseNum:(int)num{
    switch (num) {
        case 1:
            return @"一";
            break;
        case 2:
            return @"二";
            break;
        case 3:
            return @"三";
            break;
        case 4:
            return @"四";
            break;
        case 5:
            return @"五";
            break;
        case 6:
            return @"六";
            break;
        case 7:
            return @"七";
            break;
        case 8:
            return @"八";
            break;
            
        default:
            break;
    }
    return @"";
}
//计算有几行
+ (int)getRowNum:(int)totalNum divisor:(int)divisor{
    int row = 0;
    int integerNum = totalNum/divisor;
    int remandNum = totalNum%divisor;
    if (remandNum == 0) {
        row = integerNum;
    }else{
        row = integerNum + 1;
    }
    return row;
}

+ (NSString *)getChineseNumByBool:(int)num{
    if (num == 0) {
        return @"双";
    }
    return @"单";
}

+ (CGSize)getCGSizeByString:(NSString *)string font:(CGFloat)font{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGSize retSize = [string boundingRectWithSize:CGSizeMake(screen_width, 0)
                                          options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                       attributes:attribute
                                          context:nil].size;
    return retSize;
    
}

+(CGSize) boundingALLRectWithSize:(NSString*) txt Font:(UIFont*) font Size:(CGSize) size{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:txt];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:10.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [txt length])];
    
    CGSize realSize = CGSizeZero;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    CGRect textRect = [txt boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil];
    realSize = textRect.size;
#else
    realSize = [txt sizeWithFont:font constrainedToSize:size];
#endif
    
    realSize.width = ceilf(realSize.width);
    realSize.height = ceilf(realSize.height);
    return realSize;
}

+ (NSString *)getEnNumByChinese:(NSString *)chinese{
    if ([chinese isEqualToString:@"球鞋"]) {
        return @"shoes";
    }else if ([chinese isEqualToString:@"安德玛"]){
        return @"ua";
    }else if ([chinese isEqualToString:@"HONMA"]){
        return @"honma";
    }else if ([chinese isEqualToString:@"酒"]){
        return @"wine";
    }else if ([chinese isEqualToString:@"推荐"]){
        return @"other";
    }else{
        return @"";
    }
}

+ (NSInteger)getLottery:(int)price array:(NSMutableArray *)array{
    NSInteger index = 0;
    if (price == 0) {
        int i = arc4random() % 2 ;
        if (i == 1) {
            index = 2;
        }else{
            index = 6;
        }
    }else{
        for (id result in array) {
            if (price == [result intValue]) {
                index = [array indexOfObject:result] + 1;
            }
        }
    }
    return index;
}


@end
