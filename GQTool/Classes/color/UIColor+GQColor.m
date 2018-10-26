//
//  UIColor+GQColor.m
//  FBSnapshotTestCase
//
//  Created by 林国强 on 2018/10/26.
//

#import "UIColor+GQColor.h"

@implementation UIColor (GQColor)

+ (UIColor *)gq_colorWithStringHex:(NSString *)hexColor
{
    NSString *colorStr = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    BOOL hasPrefixPound = NO;
    // 123 0123 #0123 112233 #112233 00112233 #00112233
    if ([colorStr hasPrefix:@"#"]) {
        colorStr = [colorStr substringFromIndex:1];
        hasPrefixPound = YES;
    }
    // 123 0123 112233 00112233
    if (colorStr.length != 3
        && colorStr.length != 4
        && colorStr.length != 6
        && colorStr.length != 8) {

        return [UIColor clearColor];
    }
    // 112233 00112233
    if (colorStr.length == 3 || colorStr.length == 4) {
        NSMutableString *temp = @"".mutableCopy;
        [colorStr enumerateSubstringsInRange:NSMakeRange(0, colorStr.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {

            [temp appendFormat:@"%@%@", substring, substring];
        }];
        colorStr = temp.copy;
    }
    unsigned int hex;
    [[NSScanner scannerWithString:colorStr] scanHexInt:&hex];
    //forceAlpha 为 #00112233 这种情况 排除 0x112233 这样的情况
    return [self gq_colorWithHex:hex forceAlpha:colorStr.length == 8 && hasPrefixPound];
}

+ (UIColor *)gq_colorWithStringHex:(NSString *)hexColor alpha:(float)alpha
{
    //删除空格
    NSString *colorStr = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 7 characters
    if ([colorStr length] < 6 || [colorStr length] > 7) {
        return [UIColor clearColor];
    }
    //
    if ([colorStr hasPrefix:@"#"]) {
        colorStr = [colorStr substringFromIndex:1];
    }

    // Scan values
    unsigned int hex;
    [[NSScanner scannerWithString:colorStr] scanHexInt:&hex];
    return [self gq_colorWithHex:hex alpha:alpha];
}

+ (UIColor *)gq_colorWithHex:(NSUInteger)hex {
    return [self gq_colorWithHex:hex forceAlpha:NO];
}

+ (UIColor *)gq_colorWithHex:(NSUInteger)hex forceAlpha:(BOOL)forceAlpha {

    CGFloat preAlpha = ((float)((hex & 0xFF000000) >> 24))/255.0f;
    CGFloat alpha = preAlpha || forceAlpha > 0 ? preAlpha : 1;
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                            blue:((float)(hex & 0xFF))/255.0 alpha:alpha];
}

+ (UIColor *)gq_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                            blue:((float)(hex & 0xFF))/255.0 alpha:alpha];
}
@end
