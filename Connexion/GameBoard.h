//
//  GameBoard.h
//  Connexion
//
//  Created by Christopher Cohen on 5/5/14.
//  Copyright (c) 2014 Christopher Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GamePiece;

enum Turn {redTurn, blackTurn, start, end};

@interface GameBoard : NSObject

@property (nonatomic, readwrite) enum Turn turn;
@property (nonatomic, readwrite) CGPoint lastPieceAddedToBoard;


-(id)initWithEmptySlots;
-(BOOL)matrixIsNil;
-(enum State)getStateForPieceAt: (CGPoint)location;
-(void)setState: (enum State)state forPieceAt: (CGPoint)location;
-(enum Turn)nextTurn;

-(BOOL)addPieceForColumn:(NSInteger)column;
-(BOOL)addPieceWithState:(enum State)state forColumn:(NSInteger)column;

-(void)setFrame:(CGRect)frame forPieceAt:(CGPoint)location;

-(GamePiece *)viewAt:(CGPoint)location;
-(BOOL)examineGameBoardForWinningCondition;

@end
