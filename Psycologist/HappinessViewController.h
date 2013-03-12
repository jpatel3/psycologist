//
//  HappinessViewController.h
//  Happiness
//
//  Created by Jaimin Patel on 3/7/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitViewBarButtonItemPresenter.h"

@interface HappinessViewController : UIViewController <SplitViewBarButtonItemPresenter>

@property (nonatomic) int happiness; //0 - sad, 100 - happy

@end
