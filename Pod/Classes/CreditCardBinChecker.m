//
//  CreditCardBinChecker.m
//  Tricae
//
//  Created by Thiago Lioy on 9/10/14.
//  Copyright (c) 2014 Comercio BF LTDA. All rights reserved.
//

#import "CreditCardBinChecker.h"

@interface CreditCardBinChecker ()
@property(nonatomic,strong)NSArray *binRules;
@end

@implementation CreditCardBinChecker

+(CreditCardBinChecker*)shareManager{
    static CreditCardBinChecker *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[self alloc] init];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"CreditCardBins" ofType:@"json"];
        NSData* data = [NSData dataWithContentsOfFile:filePath];
        
        NSError *jsonError = nil;
        shareManager.binRules = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
        
    });
    return shareManager;
}

+(CardBinRule*)binRule:(NSString*)cardNumber{
    for(NSDictionary *dc in [self shareManager].binRules){
        CardBinRule *rule = [CardBinRule cardBinRule:dc];
        if([[self shareManager] matchCardNumber:cardNumber
                                    withPattern:rule.regex])
            return rule;
    }
    return nil;
}

-(BOOL)matchCardNumber:(NSString*)cardNumber withPattern:(NSString*)pattern{
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern
                                                                           options:0
                                                                             error:nil];
    NSArray *matches = [regex matchesInString:cardNumber
                                      options:0
                                        range:NSMakeRange(0, [cardNumber length])];
    return (matches != nil && matches.count > 0);
}

+(BOOL)isValidCard:(NSString*)cardNumber{
    CardBinRule *rule = [CreditCardBinChecker binRule:cardNumber];
    
    if (rule && [CreditCardBinChecker checkNumber:cardNumber]) {
        for (NSNumber *maxNumber in rule.maxNumbers) {
            if ([maxNumber intValue] == cardNumber.length)
                return YES;
        }
    }
    return NO;
}

+(BOOL)checkNumber:(NSString*)cardNumber{
    BOOL odd = true;
    int sum = 0;
    for (int i = cardNumber.length - 1; i >= 0; i --) {
        int digitInt = [[NSString stringWithFormat:@"%c", [cardNumber characterAtIndex:i]] intValue];
        
        if ((odd = !odd))
            digitInt *= 2;
        
        if (digitInt > 9)
            digitInt -= 9;
        
        sum += digitInt;
    }
    
    return ((sum % 10) == 0);
}

@end
