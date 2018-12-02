//
//  NSData+GQEncrypt.h
//  AFNetworking
//
//  Created by 幸.😳 on 2018/12/1.
//

#import <Foundation/Foundation.h>

@interface NSData (GQEncrypt)

- (NSString *)gq_base64Encoding;

- (NSString *)gq_base64EncodingWithLineLength:(NSUInteger)lineLength;

- (NSString *)gq_base64Decoding;

- (NSString *)gq_md5;

@end
