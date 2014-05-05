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
            
        case emptySlot:
            self.backgroundColor = [UIColor clearColor];
            break;
    }
}

-(UIColor *)lightenColor: (UIColor *)color {
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat red     = components[0];
    CGFloat green   = components[1];
    CGFloat blue    = components[2];
    
    return [UIColor colorWithRed:(red * 1.2) green:(green * 1.2) blue: (blue * 1.2) alpha:1];
    
}


-(UIColor *)darkenColor: (UIColor *)color {
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat red     = components[0];
    CGFloat green   = components[1];
    CGFloat blue    = components[2];
    
    return [UIColor colorWithRed:(red * .8) green:(green * .8) blue: (blue * .8) alpha:1];
    
}
@end
