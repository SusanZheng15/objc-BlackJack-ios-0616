//
//  FISCardDeck.h
//  OOP-Cards-Model
//
//  Created by Flatiron School on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISCardDeck : NSObject

@property(strong, nonatomic, readonly)NSMutableArray *remainingCards;
@property(strong, nonatomic, readonly)NSMutableArray *dealtCards;

-(FISCard *)drawNextCard;
-(void)resetDeck;
-(void)gatherDealtCards;
-(void)shuffleRemainingCards;

@end
