//
//  TAViewController.m
//  Flappy Bird
//
//  Created by Todd Austin on 3/15/14.
//  Copyright (c) 2014 Todd Austin. All rights reserved.
//

#import "TAViewController.h"

@interface TAViewController ()

@end

@implementation TAViewController

- (void)viewDidLoad
{
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScore.text = [NSString stringWithFormat:@"Score: %li", (long)HighScoreNumber];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
