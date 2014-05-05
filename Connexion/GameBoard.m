//
//  GameBoard.m
//  Connexion
//
//  Created by Christopher Cohen on 5/5/14.
//  Copyright (c) 2014 Christopher Cohen. All rights reserved.
//

#import "GameBoard.h"
#import "Player.h"
#import "GamePiece.h"

#define ROWS 6
#define COLUMNS 7

@interface GameBoard () {
    GamePiece *matrix[COLUMNS][ROWS];
}

@end

@implementation GameBoard

-(id)initWithEmptySlots {
    if (self = [super init]) {
        _players = @ [[[Player alloc] initWithColor:[UIColor redColor] andPieceCount:21],
                      [[Player alloc] initWithColor:[UIColor blackColor] andPieceCount:21]];
        
        CGPoint slot;
        for (slot.x = 0; slot.x < ROWS; slot.x++) {
            for (slot.y = 0; slot.y < COLUMNS; slot.y++) {
                matrix[(int)slot.x][(int)slot.y]        = [GamePiece new];
                matrix[(int)slot.x][(int)slot.y].state  = emptySlot;
            }
        }
        
        
    }
    return self;
}


-(BOOL)matrixIsNil {
    
    CGPoint slot;
    for (slot.x = 0; slot.x < ROWS; slot.x++) {
        for (slot.y = 0; slot.y < COLUMNS; slot.y++) {
            if (matrix[(int)slot.x][(int)slot.y] != nil) return NO;
        }
    }
    return  YES;
}

#pragma state access and interactions

-(enum State)getStateForPieceAt: (CGPoint)location {
    return matrix[(int)location.x][(int)location.y].state;
}

-(void)setState: (enum State)state forPieceAt: (CGPoint)location {
    
    matrix[(int)location.x][(int)location.y].state = state;
    
    return;
}

-(void)setFrame:(CGRect)frame forPieceAt:(CGPoint)location {
    matrix[(int)location.x][(int)location.y].frame = frame;
}


-(BOOL)addPieceWithState:(enum State)state forColumn:(NSInteger)column {
    
    for (int i = 0; i < 6; i++) {
        if (matrix[column][i].state == emptySlot) {
            matrix[column][i].state = state;
            return YES;
        }
    }
    
    return NO;
}

-(GamePiece *)viewAt:(CGPoint)location {
    return matrix[(int)location.x][(int)location.y];
}


@end
