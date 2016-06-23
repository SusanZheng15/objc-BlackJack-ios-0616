//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Flatiron School on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@interface FISCardDeck()


@property(strong, nonatomic, readwrite)NSMutableArray *remainingCards;
@property(strong, nonatomic, readwrite)NSMutableArray *dealtCards;

@end

@implementation FISCardDeck

-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _remainingCards = [[NSMutableArray alloc]init];
        _dealtCards = [[NSMutableArray alloc]init];
        [self generateCardDeck];
    }
    return self;
}

-(FISCard *)drawNextCard
{
    if (self.remainingCards.count == 0) //deck empty
    {
        NSLog(@"The deck is currently empty");
        return nil;
    }
    else
    {
        FISCard *pickedCard = self.remainingCards[0];
        [self.remainingCards removeObjectAtIndex:0];
        [self.dealtCards addObject:pickedCard];
        
        return pickedCard;
    }
}
-(void)resetDeck
{
    [self gatherDealtCards];
    [self shuffleRemainingCards];
}
-(void)gatherDealtCards
{
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
}
-(void)shuffleRemainingCards
{
    NSMutableArray *array = [self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    
    do
    {
        NSUInteger index = arc4random_uniform((int)[array count]);
        [self.remainingCards addObject:array[index]];
        [array removeObjectAtIndex:index];
    }
    while ([array count] != 0);
    
}
-(void)generateCardDeck
{
    for (NSString *suit in [FISCard validSuits])
    {
        for (NSString *rank in [FISCard validRanks])
        {
            FISCard *cards = [[FISCard alloc] initWithSuit:suit rank:rank];
            [self.remainingCards addObject:cards];
        }
        
    }
}

- (NSString *)description
{
    NSMutableString *customizedString = [NSMutableString stringWithString:@"count: "];
    [customizedString appendFormat:@"%lu\ncards: ", [self.remainingCards count]];
    
    for (FISCard *card in self.remainingCards)
    {
        [customizedString appendFormat:@"%@", card.description];
    }
    
    NSLog(@"%@", customizedString);
    return customizedString;
    
}

@end
