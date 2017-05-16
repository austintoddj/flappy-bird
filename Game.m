//
//  Game.m
//  Flappy Bird
//
//  Created by Todd Austin on 3/15/14.
//  Copyright (c) 2014 Todd Austin. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver{
    
    if (ScoreNumber > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    TunnelDown.hidden = YES;
    TunnelUp.hidden = YES;
    Bird.hidden = YES;
    
}

-(void)Score{
    
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
}

-(IBAction)TAP:(id)sender{
    
    TunnelDown.hidden = NO;
    TunnelUp.hidden = NO;
    
    TAP.hidden = YES;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
}

-(void)TunnelMoving{
    
    TunnelDown.center = CGPointMake(TunnelDown.center.x - 1, TunnelDown.center.y);
    TunnelUp.center = CGPointMake(TunnelUp.center.x - 1, TunnelUp.center.y);
    
    if (TunnelDown.center.x < -25) {
        [self PlaceTunnels];
    }
    
    if (TunnelDown.center.x == 83) {
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelDown.frame)) {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelUp.frame)) {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Top.frame)) {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Bottom.frame)) {
        [self GameOver];
    }
    
}

-(void)PlaceTunnels{
    
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 655;
    
    TunnelDown.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelUp.center = CGPointMake(340, RandomBottomTunnelPosition);
}

-(void)BirdMoving{
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    if (BirdFlight < -15) {
        BirdFlight = -15;
    }
    if (BirdFlight > 0) {
        Bird.image = [UIImage imageNamed:@"BirdUp.png"];
    }
        
    if (BirdFlight < 0) {
        Bird.image = [UIImage imageNamed:@"BirdDown.png"];
    }
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    BirdFlight = 30;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    TunnelDown.hidden = YES;
    TunnelUp.hidden = YES;
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
