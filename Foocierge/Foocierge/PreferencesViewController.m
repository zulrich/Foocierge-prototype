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
    NSMutableSet *yesPreferences;
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
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 680);
    preferencesDictionary = [[NSMutableDictionary alloc] init];
    yesPreferences = [[NSMutableSet alloc] init];
    
    //[self customizeAppearence];
    
}

-(void)customizeAppearence
{
    [self setSetColor:spicySegment];
    [self setSetColor:sweetSegment];
    [self setSetColor:savorySegment];
    [self setSetColor:organicSegment];
    [self setSetColor:seafoodSegment];
    [self setSetColor:saltySegment];
    [self setSetColor:priceSegment];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setSetColor:(UISegmentedControl *)controllerItem
{
    for (int i=0; i<[controllerItem.subviews count]; i++)
    {
        if ([[controllerItem.subviews objectAtIndex:i] isSelected] )
        {
            [[controllerItem.subviews objectAtIndex:i] setTintColor:[UIColor blueColor]];
        }
        else
        {
            [[controllerItem.subviews objectAtIndex:i] setTintColor:nil];
        }
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

}

- (IBAction)segmentChanged:(id)sender
{
    UISegmentedControl *controller = (UISegmentedControl *)sender;
    
    [self setSetColor:controller];
        
    if(sender == spicySegment)
    {
        
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"spicy"];
        }
        
        if (controller.selectedSegmentIndex == 2)
        {
            [yesPreferences removeObject:@"spicy"];
        }
        
        NSLog(@"%ld", (long)controller.selectedSegmentIndex);
    }
    
    else if (sender == sweetSegment)
    {
    
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"sweet"];
        }
        
        if (controller.selectedSegmentIndex == 2)
        {
            [yesPreferences removeObject:@"sweet"];
        }
    }
    
    else if (sender == savorySegment)
    {
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"savory"];
        }
        if (controller.selectedSegmentIndex == 2)
        {
            [yesPreferences removeObject:@"savory"];
        }
    }
    
    else if (sender == organicSegment)
    {

        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"organic"];
        }
        
        if (controller.selectedSegmentIndex == 2)
        {
            [yesPreferences removeObject:@"organic"];
        }
    }
    
    else if (sender == seafoodSegment)
    {
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"seafood"];
        }
        
        if (controller.selectedSegmentIndex == 2)
        {
            [yesPreferences removeObject:@"seafood"];
        }
    }
    
    else if (sender == saltySegment)
    {
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"salty"];
        }
        
        if (controller.selectedSegmentIndex == 2)
        {
            [yesPreferences removeObject:@"salty"];
        }
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
    NSLog(@"%@", yesPreferences);
    vc.dishTags = yesPreferences;
    
    
    
}
@end
