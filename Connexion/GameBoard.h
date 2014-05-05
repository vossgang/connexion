//
//  GameBoard.h
//  Connexion
//
//  Created by Christopher Cohen on 5/5/14.
//  Copyright (c) 2014 Christopher Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GamePiece;

@interface GameBoard : NSObject

@property (nonatomic, strong) NSArray *pieces;
@property (nonatomic, strong) NSArray *players;
@property (nonatomic, strong) NSArray *slots;

-(id)initWithEmptySlots;

//-(void)playPiece:(GamePiece *)gamePiece atIndex:(NSIndexPath *)indexPath;

-(BOOL)matrixIsNil;
-(enum State)getStateForPieceAt: (CGPoint)location;
-(void)setState: (enum State)state forPieceAt: (CGPoint)location;

//returns 'NO' if a piece cannot be added to an existing columns
-(BOOL)addPieceWithState:(enum State)state forColumn:(NSInteger)column;

-(void)setFrame:(CGRect)frame forPieceAt:(CGPoint)location;

-(GamePiece *)viewAt:(CGPoint)location;

@end
