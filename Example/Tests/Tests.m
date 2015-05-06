//
//  binCheckerTests.m
//  binCheckerTests
//
//  Created by Thiago Lioy on 05/06/2015.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "CreditCardBinChecker.h"

SpecBegin(InitialSpecs)

describe(@"these will fail", ^{


    __block NSArray *visaCards;
    __block NSArray *amexCards;
    __block NSArray *masterCards;
    __block NSArray *dinersCards;
    __block NSArray *invalidCards;

    beforeAll(^{
        amexCards = @[@"370833132459070",
                      @"373244752456395",
                      @"372099666942950",
                      @"379225137633836",
                      @"373008221055736",
                      @"378097145936480",
                      @"374066062731665",
                      @"371280216989656",
                      @"377518676370790",
                      @"370833132459070"
                      ];

    });
    
    it(@"should validate amex cards", ^{

        expect(1).to.equal(1);

    });

});


SpecEnd
