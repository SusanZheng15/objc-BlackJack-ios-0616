//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by Flatiron School on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"

@interface FISCard()

@property(strong, nonatomic, readwrite)NSString *suit;
@property(strong, nonatomic, readwrite)NSString *rank;
@property(strong, nonatomic, readwrite)NSString *cardLabel;
@property(nonatomic, readwrite)NSUInteger cardValue;

@end

@implementation FISCard

-(instancetype)init
{
    self = [self initWithSuit:@"!" rank:@"N"];
    return self;
}

-(instancetype)initWithSuit:(NSString *)suit rank:(NSString *)rank
{
    self = [super init];
    if(self)
    {
        _suit = suit;
        _rank = rank;
        _cardLabel = [NSString stringWithFormat:@"%@%@", suit, rank];
        _cardValue = [self cardValueForRank:rank];
    }
    return self;
}

+(NSArray*)validSuits
{
    NSArray *validSuits = @[@"♠",@"♥",@"♣",@"♦"];
    return validSuits;
}

+(NSArray*)validRanks
{
    NSArray *validRanks = @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return validRanks;
}

-(NSUInteger)cardValueForRank:(NSString *)rank
{
    NSArray *validRanks = @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    
    if ([validRanks indexOfObject:rank] < 10)
    {
        _cardValue = [validRanks indexOfObject:rank] + 1;
        return _cardValue;
    }
    else
    {
        _cardValue = 10;
        return _cardValue;
    }
    
}

-(NSString *)description
{
    return _cardLabel;
}

@end
