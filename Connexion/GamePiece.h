//
//  GamePiece.h
//  Connexion
//
//  Created by Christopher Cohen on 5/5/14.
//  Copyright (c) 2014 Christopher Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player, GameBoard, GamePieceView;

enum State {emptySlot, redPiece, blackPiece};

@interface GamePiece : UIView

@property (strong, nonatomic) UIColor       *color;
//@property (weak, nonatomic) Player          *player;
//@property (weak, nonatomic) GameBoard       *gameBoard;

//bool flags
@property(nonatomic, readwrite) BOOL isHighlighted;
@property (nonatomic) enum State state;


-(void)setState:(enum State)state;

+(GamePiece *)newPieceWithColor: (UIColor *)color;

@end
