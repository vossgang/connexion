//
//  ViewController.m
//  Connexion
//
//  Created by Christopher Cohen on 5/5/14.
//  Copyright (c) 2014 Christopher Cohen. All rights reserved.
//

#import "ViewController.h"
#import "GameBoard.h"
#import "GamePiece.h"
#import "Player.h"

#define CIRCLE_SIZE 45.5

@interface ViewController ()

@property (strong, nonatomic) GameBoard *gameBoard;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _gameBoard = [[GameBoard alloc] initWithEmptySlots];
    
    [self setupBoardView];

	// Do any additional setup after loading the view, typically from a nib.
}

-(void)setupBoardView {
    
    //initial setup
    CGFloat xCoordinate = 0.f;
    CGFloat yCoordinate = 150.f;
    
    CGPoint locationInMatrix;
    
    //setup initial cell states
    for (locationInMatrix.x = 0; locationInMatrix.x < 7; locationInMatrix.x++) {
        for (locationInMatrix.y = 0; locationInMatrix.y < 6; locationInMatrix.y++) {
            
            [_gameBoard setFrame:CGRectMake(xCoordinate, yCoordinate, CIRCLE_SIZE, CIRCLE_SIZE) forPieceAt:locationInMatrix];
            [_gameBoard setState:empty forPieceAt:locationInMatrix];
            [self.view addSubview:[_gameBoard viewAt:locationInMatrix]];
            
            yCoordinate = yCoordinate + CIRCLE_SIZE;
        } //end inner 'for loop'
        xCoordinate = xCoordinate + CIRCLE_SIZE;
        yCoordinate = 150;
    } //end outer 'for loop'
    
    return;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint touchPoint = [touch locationInView:self.view];
        
        NSInteger touchStripe = CIRCLE_SIZE;
        
        if (touchPoint.x < touchStripe) {
            [_gameBoard addPieceWithState:red forColumn:0];
            return;
        }
        if (touchPoint.x > touchStripe && touchPoint.x < touchStripe + CIRCLE_SIZE) {
            [_gameBoard addPieceWithState:red forColumn:1];
            return;
        }
        
        touchStripe += CIRCLE_SIZE;
        
        if (touchPoint.x > touchStripe && touchPoint.x < touchStripe + CIRCLE_SIZE) {
            [_gameBoard addPieceWithState:red forColumn:2];
            return;
        }
        
        touchStripe += CIRCLE_SIZE;

        if (touchPoint.x > 136.5 && touchPoint.x < 182) {
            [_gameBoard addPieceWithState:red forColumn:3];
            return;
        }
        
        touchStripe += CIRCLE_SIZE;

        if (touchPoint.x > 182 && touchPoint.x < 227) {
            [_gameBoard addPieceWithState:red forColumn:4];
            return;
        }
        
        touchStripe += CIRCLE_SIZE;

        if (touchPoint.x > 227 && touchPoint.x < 273) {
            [_gameBoard addPieceWithState:red forColumn:5];
            return;
        }
        
        touchStripe += CIRCLE_SIZE;

        
        if (touchPoint.x > 273) {
            [_gameBoard addPieceWithState:red forColumn:6];
            return;
        }
    
        
        
    }
}







- (IBAction)columnC:(id)sender {
    [_gameBoard addPieceWithState:red forColumn:3];
}

- (IBAction)columnD:(id)sender {
    [_gameBoard addPieceWithState:red forColumn:4];
}

- (IBAction)columnE:(id)sender {
    [_gameBoard addPieceWithState:red forColumn:5];
}

- (IBAction)columnF:(id)sender {
    [_gameBoard addPieceWithState:red forColumn:6];
}

- (IBAction)columnG:(id)sender {
    [_gameBoard addPieceWithState:red forColumn:7];
}

@end
