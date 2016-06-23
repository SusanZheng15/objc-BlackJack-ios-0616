//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Flatiron School on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer


-(instancetype)init
{
    self = [self initWithName:@""];
    return self;
}
-(instancetype)initWithName: (NSString*)name
{
    self = [super init];
    
    if(self)
    {
        _name = name;
        _cardsInHand = [NSMutableArray new];
        _busted = NO;
        _blackjack = NO;
        _stayed = NO;
        _handscore = 0;
        _wins = 0;
        _losses = 0;
    }
    return self;
}

-(void)resetForNewGame
{
    [_cardsInHand removeAllObjects];
    _handscore = 0;
    _aceInHand = NO;
    _blackjack = NO;
    _busted = NO;
    _stayed = NO;
   
    
}
-(void)acceptCard:(FISCard*)card
{
    [self.cardsInHand addObject:card];
    self.handscore = self.handscore + card.cardValue;
   
    if([card.rank isEqualToString:@"A"])
    {
        _aceInHand = YES;
    }
    if(self.aceInHand == YES && self.handscore <= 11)
    {
        self.handscore = self.handscore + 10;
    }
    
    if(self.handscore == 21)
    {
        self.blackjack = YES;
    }
    else if (self.handscore > 21)
    {
        self.busted = YES;
    }
    
}

-(BOOL)shouldHit
{
    if(self.handscore >= 16)
    {
        self.stayed = YES;
        return NO;
    }
    return YES;
}
-(NSString*)description
{
    NSMutableString *game = [[NSMutableString alloc]init];
    
    [game appendFormat:@"\n name:%@ \ncards:%@ \nhandscore: %lu \nace in hand:%i \nstayed:%i \nblackjack:%i \nbusted:%i \nwins:%lu \nlosses:%lu", self.name, self.cardsInHand, self.handscore, self.aceInHand, self.stayed, self.blackjack, self.busted, self.wins, self.losses];
    return game;
}
@end
