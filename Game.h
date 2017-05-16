//
//  Game.h
//  Flappy Bird
//
//  Created by Todd Austin on 3/15/14.
//  Copyright (c) 2014 Todd Austin. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumber;


@interface Game : UIViewController
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *TAP;
    IBOutlet UIImageView *TunnelUp;
    IBOutlet UIImageView *TunnelDown;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    
    NSTimer *BirdMovement;
    NSTimer *TunnelMovement;
    
}

-(IBAction)TAP:(id)sender;
-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;


@end
