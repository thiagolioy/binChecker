//
//  CreditCardBinResponse.h
//  Tricae
//
//  Created by Thiago Lioy on 9/10/14.
//  Copyright (c) 2014 Comercio BF LTDA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardBinRule : NSObject
@property(nonatomic,strong)NSString *issuer;
@property(nonatomic,strong)NSString *regex;
@property(nonatomic,assign)NSInteger maxSecurityCardCode;
@property(nonatomic,strong)NSArray *maxNumbers;


+(instancetype)cardBinRule:(NSDictionary*)dict;
@end
