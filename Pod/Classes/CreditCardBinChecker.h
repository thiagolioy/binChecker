//
//  CreditCardBinChecker.h
//  Tricae
//
//  Created by Thiago Lioy on 9/10/14.
//  Copyright (c) 2014 Comercio BF LTDA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardBinRule.h"

@interface CreditCardBinChecker : NSObject

+(CardBinRule*)binRule:(NSString*)cardNumber;
+(BOOL)isValidCard:(NSString*)cardNumber;

@end
