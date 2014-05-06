//
//  GamePiece.m
//  Connexion
//
//  Created by Christopher Cohen on 5/5/14.
//  Copyright (c) 2014 Christopher Cohen. All rights reserved.
//

#import "GamePiece.h"

@implementation GamePiece


+(GamePiece *)newPieceWithColor: (UIColor *)color {
    GamePiece *newPiece = [GamePiece new];
    newPiece.color = color;
    return newPiece;
}

#pragma mark - setter override
-(void)setState:(enum State)state {
    
    _state = state;
    
    switch (_state) {
        case blackPiece:
            self.backgroundColor = [UIColor darkGrayColor];
            self.layer.cornerRadius = self.frame.size.width / 2;
            self.clipsToBounds = YES;
            self.layer.borderWidth = 2;
            self.layer.borderColor = [UIColor blackColor].CGColor;
            break;
            
        case redPiece:
            self.backgroundColor = [UIColor redColor];
            self.layer.cornerRadius = self.frame.size.width / 2;
            self.clipsToBounds = YES;
            self.layer.borderWidth = 2;
            self.layer.borderColor = [UIColor blackColor].CGColor;
            break;
            
        case empty:
            self.backgroundColor = [UIColor clearColor];
            break;
    }
}

-(BOOL)isBlack {
    if (_state == blackPiece) return YES;
    return NO;
}

-(BOOL)isRed {
    if (_state == redPiece) return YES;
    return NO;
}

@end
