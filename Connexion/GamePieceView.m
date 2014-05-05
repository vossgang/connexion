//
//  GamePieceView.m
//  Connexion
//
//  Created by Christopher Cohen on 5/5/14.
//  Copyright (c) 2014 Christopher Cohen. All rights reserved.
//

#import "GamePieceView.h"

@implementation GamePieceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* color22 = [self darkenColor:_color];
    UIColor* color24 = [self lightenColor:_color];
    UIColor* color25 = [self lightenColor:_color];
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(3, 3, 94, 94)];
    [color22 setFill];
    [oval2Path fill];
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(14, 14, 72, 72)];
    [color25 setFill];
    [ovalPath fill];
    [color24 setStroke];
    ovalPath.lineWidth = 20.5;
    [ovalPath stroke];

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
