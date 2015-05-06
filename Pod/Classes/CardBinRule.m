//
//  CreditCardBinResponse.m
//  Tricae
//
//  Created by Thiago Lioy on 9/10/14.
//  Copyright (c) 2014 Comercio BF LTDA. All rights reserved.
//

#import "CardBinRule.h"

@implementation CardBinRule

+(instancetype)cardBinRule:(NSDictionary*)dict{
    CardBinRule *r = [CardBinRule new];
    r.issuer = [dict valueForKey:@"issuer"];
    r.regex = [dict objectForKey:@"regex"];
    r.maxNumbers = [CardBinRule arrayOfNumber:[dict objectForKey:@"maxNumbers"]];
    r.maxSecurityCardCode = [[dict objectForKey:@"maxSecurityCardCode"] intValue];

    return r;
}

+(NSArray*)arrayOfNumber:(NSArray*)array{
    NSMutableArray *arrayNumber = [[NSMutableArray alloc] initWithCapacity:[array count]];
    
    for (int i = 0; i < array.count; i++){
        NSNumber *value = [NSNumber numberWithInt:[[array objectAtIndex:i] intValue]];
        [arrayNumber addObject:value];
    }
    
    return arrayNumber;
}

@end
