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
            [[controllerItem.subviews objectAtIndex:i] setTintColor:[UIColor greenColor]];
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
        //[preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"spicy"];
        
        //[preferencesDictionary setObject:@"spicy" forKey:[NSNumber numberWithInt:controller.selectedSegmentIndex]];
        
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"spicy"];
        }
        
        NSLog(@"%ld", (long)controller.selectedSegmentIndex);
    }
    
    else if (sender == sweetSegment)
    {
        //[preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"sweet"];
        //[preferencesDictionary setObject:@"spicy" forKey:[NSNumber numberWithInt:controller.selectedSegmentIndex]];
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"sweet"];
        }
    }
    
    else if (sender == savorySegment)
    {
        //[preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"savory"];
        //[preferencesDictionary setObject:@"spicy" forKey:[NSNumber numberWithInt:controller.selectedSegmentIndex]];
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"savory"];
        }
    }
    
    else if (sender == organicSegment)
    {
        //NSLog(@"organic");
        //[preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"organic"];
        //[preferencesDictionary setObject:@"spicy" forKey:[NSNumber numberWithInt:controller.selectedSegmentIndex]];
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"organic"];
        }
    }
    
    else if (sender == seafoodSegment)
    {
        //[preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"seafood"];
        //[preferencesDictionary setObject:@"spicy" forKey:[NSNumber numberWithInt:controller.selectedSegmentIndex]];
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"seafood"];
        }
    }
    
    else if (sender == saltySegment)
    {
        //[preferencesDictionary setObject:[NSNumber numberWithInt:controller.selectedSegmentIndex ] forKey:@"salty"];
        //[preferencesDictionary setObject:@"spicy" forKey:[NSNumber numberWithInt:controller.selectedSegmentIndex]];
        if (controller.selectedSegmentIndex == 0)
        {
            [yesPreferences addObject:@"salty"];
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
