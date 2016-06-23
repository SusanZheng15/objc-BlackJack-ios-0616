//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Flatiron School on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        _deck = [[FISCardDeck alloc]init];
        _player = [[FISBlackjackPlayer alloc]initWithName:@"Player"];
        _house = [[FISBlackjackPlayer alloc]initWithName:@"House"];
    }
    return self;
}
-(void)playBlackjack
{
    [self.deck resetDeck];
    [self.player resetForNewGame];
    [self.house resetForNewGame];
    [self dealNewRound];
    
    for (NSUInteger i = 0; i < 3; i++)
    {
        [self processPlayerTurn];
        [self processHouseTurn];
        
            if (self.player.busted == YES || self.house.busted == YES)
            {
                break;
            }
     
    }
    
    [self incrementWinsAndLossesForHouseWins:[self houseWins]];
    
    NSLog(@"%@", self.player.description);
    NSLog(@"%@",self.house.description);
    
}
-(void)dealNewRound
{
    [self dealCardToHouse];
    [self dealCardToPlayer];
    [self dealCardToHouse];
    [self dealCardToPlayer];
}
-(void)dealCardToPlayer
{
    [self.player acceptCard:self.deck.drawNextCard];
}
-(void)dealCardToHouse
{
    [self.house acceptCard:self.deck.drawNextCard];
}
-(void)processPlayerTurn
{
    if(self.player.busted == NO && self.player.stayed == NO)
    {
        if(self.player.shouldHit == YES)
        {
            [self dealCardToPlayer];
        }
        
    }
    
}
-(void)processHouseTurn
{
    if(self.house.busted == NO && self.house.stayed == NO)
    {
        if(self.house.shouldHit == YES)
        {
            [self dealCardToHouse];
        }
    
    }

}
-(BOOL)houseWins
{
    if(self.house.blackjack == YES && self.player.blackjack == YES)
    {
        return NO;
    }
    if(self.house.blackjack == YES || self.house.handscore > self.player.handscore)
    {
        return YES;
    }
    if(self.house.busted == YES)
    {
        return NO;
    }
    if(self.player.busted == YES)
    {
        return YES;
    }
    if(self.house.handscore == self.player.handscore)
    {
        return YES;
    }
    
    return NO;
}
-(void)incrementWinsAndLossesForHouseWins: (BOOL)houseWins
{
    if(houseWins == YES)
    {
        self.house.wins++;
        self.player.losses++;
    }
    else
    {
        self.player.wins++;
        self.house.losses++;
    }
}
@end
