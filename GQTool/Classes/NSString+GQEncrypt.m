//
//  NSString+GQEncrypt.m
//  AFNetworking
//
//  Created by 幸.😳 on 2018/12/1.
//

#import "NSString+GQEncrypt.h"
#import "NSData+GQEncrypt.h"

@implementation NSString (GQEncrypt)

- (NSString *)gq_base64Encoding
{
    return [self gq_base64EncodingWithLineLength:0];
}

- (NSString *)gq_base64EncodingWithLineLength:(NSUInteger)lineLength
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] gq_base64EncodingWithLineLength:lineLength];
}

- (NSString *)gq_base64Decoding {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] gq_base64Decoding];
}

- (NSString*)gq_md5
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] gq_md5];
}

@end
