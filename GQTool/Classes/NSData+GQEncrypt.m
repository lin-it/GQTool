//
//  NSData+GQEncrypt.m
//  AFNetworking
//
//  Created by 幸.😳 on 2018/12/1.
//

#import "NSData+GQEncrypt.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

inline static NSString *fullToFourfoldString(NSString *string) {
    
    NSInteger shortLength = string.length - string.length / 4 * 4;
    NSString *result = string;
    for (NSInteger i = 0; i < shortLength; ++i) {
        result = [string stringByAppendingString:@"="];
    }
    return result;
}


@implementation NSData (GQEncrypt)
- (NSString *)gq_base64Encoding
{
    return [self gq_base64EncodingWithLineLength:0];
}

- (NSString *)gq_base64EncodingWithLineLength:(NSUInteger)lineLength
{
    NSDataBase64EncodingOptions options = 0;
    switch (lineLength) {
            case 64:
            options = NSDataBase64Encoding64CharacterLineLength;
            break;
            case 76:
            options = NSDataBase64Encoding76CharacterLineLength;
            break;
        default:
            break;
    }
    
    return [self base64EncodedStringWithOptions:options];
}

- (NSString *)gq_base64Decoding {
    NSString *str = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    NSData *data = [[NSData alloc] initWithBase64EncodedString:fullToFourfoldString(str) options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString*)gq_md5
{
    const char *cStr = [self bytes];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    if(cStr)
    {
        CC_MD5( cStr, (CC_LONG)(self.length), result );
        return [[NSString stringWithFormat:
                 @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                 result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                 result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
                 ] lowercaseString];
    } else {
        return nil;
    }
}

@end
