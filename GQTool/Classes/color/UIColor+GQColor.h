//
//  UIColor+GQColor.h
//  FBSnapshotTestCase
//
//  Created by 林国强 on 2018/10/26.
//

#import <UIKit/UIKit.h>

@interface UIColor (GQColor)

/**
 * 支持从HEX值扩展获取alpha + color
 * 如0xFF00FF00 等于 0x00FF00 的色值加上  0xFF/255.0f 的alpha
 *
 * @param hex hex值
 */

+ (UIColor *)gq_colorWithHex:(NSUInteger)hex;

/**
 * 功能同 +gq_colorWithExtendHex:
 *
 * @param  hexString 颜色值字符串 如"#FF00FF00"
 */
+ (UIColor *)gq_colorWithStringHex:(NSString *)hexColor;

/**
 * 从HEX值获取颜色值
 *
 * @param hex     颜色值，如 0xFFFFF
 * @param alpha   透明度
 */
+ (UIColor *)gq_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;

/**
 * 从HEX 字符串获取颜色值
 *
 * @param hexColor  颜色值 如 @"#00FF00"
 * @param alpha     透明度
 */
+ (UIColor *)gq_colorWithStringHex:(NSString *)hexColor alpha:(float)alpha;


@end
