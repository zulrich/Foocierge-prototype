//
//  PreferencesViewController.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/19/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "PreferencesViewController.h"
#import "RestaurantsViewController.h"
#import "enums.h"

@interface PreferencesViewController ()
{
    NSMutableDictionary *preferencesDictionary;
}

@end

@implementation PreferencesViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"height %f" , scrollView.frame.size.height);
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 630);
    preferencesDictionary = [[NSMutableDictionary alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrolling");
}

- (IBAction)segmentChanged:(id)sender
{
    NSLog(@"segment changed");
    
    UISegmentedControl *controller = (UISegmentedControl *)sender;
    NSLog(@"selected index %d", controller.selectedSegmentIndex);
    for (int i=0; i<[controller.subviews count]; i++)
    {
        if ([[controller.subviews objectAtIndex:i]isSelected] )
        {
            //UIColor *tintcolor=[UIColor colorWithRed:127.0/255.0 green:161.0/255.0 blue:183.0/255.0 alpha:1.0];
            
            NSLog(@"match at subview %d", i);
            [[controller.subviews objectAtIndex:i] setTintColor:[UIColor greenColor]];
        }
        else
        {
            [[controller.subviews objectAtIndex:i] setTintColor:nil];
        }
    }
    
    if(sender == spicySegment)
    {
        [preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"spicy"];
    }
    
    else if (sender == sweetSegment)
    {
        [preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"sweet"];
    }
    
    else if (sender == savorySegment)
    {
        [preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"savory"];
    }
    
    else if (sender == organicSegment)
    {
        NSLog(@"organic");
        [preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"organic"];
    }
    
    else if (sender == seafoodSegment)
    {
        [preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"seafood"];
    }
    
    else if (sender == saltySegment)
    {
        [preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"salty"];
    }
    
    else if (sender == priceSegment)
    {
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RestaurantsViewController *vc = (RestaurantsViewController *)segue.destinationViewController;
    vc.preferencesDictionary = preferencesDictionary;
    vc.cuisineArray = self.cuisinePreferences;
    
}
@end
