//
//  HappinessViewController.m
//  Happiness
//
//  Created by Jaimin Patel on 3/7/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

@interface HappinessViewController() <FaceViewDataSource>
@property (nonatomic, weak) IBOutlet FaceView *faceView;
@end

@implementation HappinessViewController

@synthesize happiness = _happiness;
@synthesize faceView = _faceView;

- (void) setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceView setNeedsDisplay]; //Never try DrawRect directly. Whenver happiness changes, redraw
}

- (void)setFaceView:(FaceView *)faceView{
    _faceView = faceView;
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]]; //target cannot be faceview because it cannot handle this gesture it cannot see the model, only the controller can do it.

    
    self.faceView.dataSource = self;
}

- (void) handleHappinessGesture: (UIPanGestureRecognizer *)gesture
{
    if((gesture.state == UIGestureRecognizerStateChanged) ||
       (gesture.state == UIGestureRecognizerStateEnded)){
        CGPoint translation = [gesture translationInView:self.faceView];
        self.happiness -= translation.y /2;
        [gesture setTranslation:CGPointZero inView:self.faceView];
    }   
}

- (float) smileForFaceView:(FaceView *)sender
{
    return (self.happiness -50) /50.0;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}

@end
