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

#define CIRCLE_SIZE 45.5
#define ROWS 6
#define COLUMNS 7

@interface GameBoard () {
    GamePiece *matrix[COLUMNS][ROWS];
}

@end

@implementation GameBoard

-(id)initWithEmptySlots {
    if (self = [super init]) {
        
        _turn = redTurn;
        
        //initial setup
        CGFloat xCoordinate = 0.f;
        CGFloat yCoordinate = 150.f;
        
        CGPoint locationInMatrix;
        
        //setup initial cell states
        for (locationInMatrix.x = 0; locationInMatrix.x < COLUMNS; locationInMatrix.x++) {
            for (locationInMatrix.y = 0; locationInMatrix.y < ROWS; locationInMatrix.y++) {
                
                //allocate and initialize
                matrix[(int)locationInMatrix.x][(int)locationInMatrix.y] = [GamePiece new];

                //set piece state
                [self setPieceState:empty forLocation:locationInMatrix];

                //assign a frame to each piece
                [self setFrame:CGRectMake(xCoordinate, yCoordinate, CIRCLE_SIZE, CIRCLE_SIZE) forPieceAt:locationInMatrix];
                [self setState:empty forPieceAt:locationInMatrix];
                
                yCoordinate = yCoordinate + CIRCLE_SIZE;
            } //end inner 'for loop'
            xCoordinate = xCoordinate + CIRCLE_SIZE;
            yCoordinate = 150;
        } //end outer 'for loop'
        
    }
    return self;
}

-(enum Turn)nextTurn {

    if (_turn == blackTurn) {
        _turn = redTurn;
        return redTurn;
    } else {
        _turn = blackTurn;
        return blackTurn;
    }
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

-(BOOL)addPieceForColumn:(NSInteger)column {
    if (_turn == redTurn) {
        [self addPieceWithState:redPiece forColumn:column];
    } else {
        [self addPieceWithState:blackPiece forColumn:column];
    }
    [self examineGameBoardForWinningCondition];
    [self nextTurn];

    return YES;
}

-(BOOL)addPieceWithState:(enum State)state forColumn:(NSInteger)column {
    
    for (int i = 0; i < 6; i++) {
        if (matrix[column][i].state == empty) {
            matrix[column][i].state = state;
            _lastPieceAddedToBoard = CGPointMake(column, i);
            return YES;
        }
    }
        
    return NO;
}

-(void)setPieceState:(enum State)state forLocation:(CGPoint)location   {
    matrix[(int)location.x][(int)location.y].state = state;
    return;
}

-(GamePiece *)viewAt:(CGPoint)location {
    return matrix[(int)location.x][(int)location.y];
}


//-(NSInteger)familialNeighborCountForPieceAt:(CGPoint)location {
//    
//    if (matrix[(int)location.x][(int)location.y].isRed) {
//        return  matrix[(int)location.x-1][(int)location.y-1].isRed +
//                matrix[(int)location.x][(int)location.y-1].isRed   +
//                matrix[(int)location.x+1][(int)location.y-1].isRed +
//                matrix[(int)location.x-1][(int)location.y].isRed   +
//                matrix[(int)location.x+1][(int)location.y].isRed   +
//                matrix[(int)location.x-1][(int)location.y+1].isRed +
//                matrix[(int)location.x][(int)location.y+1].isRed   +
//                matrix[(int)location.x+1][(int)location.y+1].isRed;
//    } else {
//        return  matrix[(int)location.x-1][(int)location.y-1].isBlack +
//                matrix[(int)location.x][(int)location.y-1].isBlack   +
//                matrix[(int)location.x+1][(int)location.y-1].isBlack +
//                matrix[(int)location.x-1][(int)location.y].isBlack   +
//                matrix[(int)location.x+1][(int)location.y].isBlack   +
//                matrix[(int)location.x-1][(int)location.y+1].isBlack +
//                matrix[(int)location.x][(int)location.y+1].isBlack   +
//                matrix[(int)location.x+1][(int)location.y+1].isBlack;
//    }
//    
//}


-(BOOL)examineGameBoardForWinningCondition {
    
    if ([self examineRowForWinningCondition] || [self examineColumnForWinningCondition] || [self examineDiagonalForWinningCondition]) {
        NSLog(@"WIN!");
        return YES;
    }
    
    return NO;
}

-(BOOL)examineRowForWinningCondition {
    NSInteger row               = _lastPieceAddedToBoard.x;
    NSInteger conjoinedPieces   = 0;
    
    for (int i = 0; i < ROWS-1; i++) {
        if (matrix[i][row].state != empty) {
            if (matrix[i][row].state == matrix[i+1][row].state) {
                conjoinedPieces++;
                if (conjoinedPieces == 3) return YES;
            } else {
                conjoinedPieces = 0;
            }
        } else {
            conjoinedPieces = 0;
        }
    }
    
    return NO;
}


-(BOOL)examineColumnForWinningCondition {
    NSInteger column            = _lastPieceAddedToBoard.y;
    NSInteger conjoinedPieces   = 0;
    
    for (int i = 0; i < COLUMNS-1; i++) {
        if (matrix[column][i].state != empty) {
            if (matrix[column][i].state == matrix[column][i+1].state) {
                conjoinedPieces++;
                if (conjoinedPieces == 3) return YES;
            } else {
                conjoinedPieces = 0;
            }
        } else {
            conjoinedPieces = 0;
        }
    }
    
    return NO;
}

-(BOOL)examineDiagonalForWinningCondition {
    return NO;
}



@end
