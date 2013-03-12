//
//  PsycologistViewController.m
//  Psycologist
//
//  Created by Jaimin Patel on 3/7/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PsycologistViewController.h"
#import "HappinessViewController.h"

@interface PsycologistViewController()
@property (nonatomic) int diagnosis;
@end

@implementation PsycologistViewController

@synthesize diagnosis = _diagnosis;

-(HappinessViewController *) splitViewHappinessViewController
{
    id hvc = [self.splitViewController.viewControllers lastObject];
    if(![hvc isKindOfClass:[HappinessViewController class]]){
        hvc = nil;
    }
    return hvc;
}

- (void)setAndShowDiagnosis: (int)diagnosis;
{
    self.diagnosis = diagnosis;
    
    if([self splitViewHappinessViewController]){
        [self splitViewHappinessViewController].happiness = diagnosis;
    }else{
        [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowDiagnosis"]){
        [segue.destinationViewController setHappiness: self.diagnosis];
    }else if ([segue.identifier isEqualToString:@"Celebrity"]){
        [segue.destinationViewController setHappiness:100];
    }else if ([segue.identifier isEqualToString:@"Problem"]){
        [segue.destinationViewController setHappiness:20];    
    }else if ([segue.identifier isEqualToString:@"TV Kook"]){
        [segue.destinationViewController setHappiness:50];
    }
}

- (IBAction)flying:(id)sender {
    [self setAndShowDiagnosis:85];
}

- (IBAction)apple:(id)sender {
    [self setAndShowDiagnosis:100];
}

- (IBAction)dragons:(id)sender {
    [self setAndShowDiagnosis:20];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
