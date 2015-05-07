//
//  binCheckerTests.m
//  binCheckerTests
//
//  Created by Thiago Lioy on 05/06/2015.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "CreditCardBinChecker.h"

SpecBegin(InitialSpecs)

describe(@"CreditCardBinChecker", ^{


    
    describe(@"VisaCards", ^{
        __block NSArray *cards;
        
        beforeAll(^{
            cards = @[@"4367096557513618",
                          @"4384841266882633",
                          @"4350425572112263",
                          @"4376685698231947",
                          @"4797500356549723",
                          @"4394088974909740",
                          @"4047403209450207",
                          @"4320612279994922",
                          @"4047036548977066",
                          @"4532210804694",
                          @"4916437535738",
                          @"4485140842054",
                          @"4539096914950",
                          @"4082314712237"
                          
                          ];
            
        });
        
        it(@"should create a bin rule with a card number", ^{
            NSString *cardNumber =  @"4394088974909740";
            CardBinRule *r = [CreditCardBinChecker  binRule:cardNumber];
            expect(r.issuer).to.equal(@"visa");
        });
        
        it(@"should validate valid visa cards", ^{
            for(NSString *cardNumber in cards){
                CardBinRule *r = [CreditCardBinChecker  binRule:cardNumber];
                expect([CreditCardBinChecker isValidCard:cardNumber]).to.equal(YES);
                expect(r).notTo.beNil();
                expect(r.issuer).to.equal(@"visa");
                expect(r.maxSecurityCardCode).to.equal(3);
            }
        });
    });
    
    describe(@"AmexCards", ^{
        __block NSArray *cards;
        
        beforeAll(^{
            cards = @[@"370833132459070",
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
        
        it(@"should create a bin rule with a card number", ^{
            NSString *cardNumber =  @"377518676370790";
            CardBinRule *r = [CreditCardBinChecker  binRule:cardNumber];
            expect(r.issuer).to.equal(@"amex");
        });
        
        it(@"should validate valid amex cards", ^{
            for(NSString *cardNumber in cards){
                CardBinRule *r = [CreditCardBinChecker  binRule:cardNumber];
                expect([CreditCardBinChecker isValidCard:cardNumber]).to.equal(YES);
                expect(r).notTo.beNil();
                expect(r.issuer).to.equal(@"amex");
                expect(r.maxSecurityCardCode).to.equal(4);
            }
        });
    });

    describe(@"masterCards", ^{
        __block NSArray *cards;
        
        beforeAll(^{
            cards = @[@"5480450021286468",
                      @"5480458454139534",
                      @"5480456780068286",
                      @"5480452698372969",
                      @"5480459253157008",
                      @"5480451654794356",
                      @"5480459409942691",
                      @"5480455705967812",
                      @"5480453271689647",
                      @"5480456681478162"
                      ];
            
        });
        
        it(@"should create a bin rule with a card number", ^{
            NSString *cardNumber =  @"5480456681478162";
            CardBinRule *r = [CreditCardBinChecker  binRule:cardNumber];
            expect(r.issuer).to.equal(@"master");
        });
        
        it(@"should validate valid master cards", ^{
            for(NSString *cardNumber in cards){
                CardBinRule *r = [CreditCardBinChecker  binRule:cardNumber];
                expect([CreditCardBinChecker isValidCard:cardNumber]).to.equal(YES);
                expect(r).notTo.beNil();
                expect(r.issuer).to.equal(@"master");
                expect(r.maxSecurityCardCode).to.equal(3);
            }
        });
    });

    describe(@"diners Cards", ^{
        __block NSArray *cards;
        
        beforeAll(^{
            cards = @[@"3095613426230637",
                     @"3095725337508156",
                     @"3095707365248657",
                     @"3095381979891375",
                     @"3095358078298587",
                     @"3095875984353867",
                     @"30045375713012",
                     @"38177831161437",
                     @"30195648396523",
                     @"30353517373558",
                     @"38781350097896",
                     @"30271861678978",
                     @"36044876350071"
                     ];
            
        });
        
        it(@"should create a bin rule with a card number", ^{
            NSString *cardNumber =  @"36044876350071";
            CardBinRule *r = [CreditCardBinChecker  binRule:cardNumber];
            expect(r.issuer).to.equal(@"diners");
        });
        
        it(@"should validate valid diners cards", ^{
            for(NSString *cardNumber in cards){
                CardBinRule *r = [CreditCardBinChecker  binRule:cardNumber];
                expect([CreditCardBinChecker isValidCard:cardNumber]).to.equal(YES);
                expect(r).notTo.beNil();
                expect(r.issuer).to.equal(@"diners");
                expect(r.maxSecurityCardCode).to.equal(3);
            }
        });
    });
    
    describe(@"Invalid Cards", ^{
        __block NSArray *cards;
        
        beforeAll(^{
            cards = @[@"11111111111",
                      @"77778799878979",
                      @"2",
                      @"0",
                      @"",
                      @"kslfk;dklf;",
                      @"djskdjlsjkadljl",
                      @"35305997061844444",
                      @"5555555555555555",
                      @"44444444444444",
                      @"3678346231897349"
                      ];
            
        });
        
        it(@"should not create a bin rule with an invalid card number", ^{
            NSString *cardNumber =  @"36044876350071";
            CardBinRule *r = [CreditCardBinChecker  binRule:cardNumber];
            expect(r).to.beNil;
        });
        
        it(@"should not validate invalid cards", ^{
            for(NSString *cardNumber in cards){
                expect([CreditCardBinChecker isValidCard:cardNumber]).to.equal(NO);
            }
        });
    });
    
});


SpecEnd
