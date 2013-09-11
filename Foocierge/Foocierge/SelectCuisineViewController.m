//
//  SelectCuisineViewController.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/17/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "SelectCuisineViewController.h"
#import "PreferencesViewController.h"
#import "CuisineCell.h"
#import <Parse/Parse.h>

@interface SelectCuisineViewController ()
{
    NSArray *cuisineOptions;
    NSMutableArray *selectedOptions;
}

@end

@implementation SelectCuisineViewController

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
    
    cuisineOptions = [[NSArray alloc] initWithObjects:@"Mediterranean",@"Mexican",@"Italian", @"American", @"Chinese",
                      @"Thai", @"Indian", @"Vietnamese", nil];
    
    selectedOptions = [[NSMutableArray alloc] init];
    
    
//    for (int i = 0; i <= 60; i++)
//    {
//        PFObject *menuItem = [PFObject objectWithClassName:@"MenuItems"];
//        [menuItem setObject:@"Fireside Caffe Deli & Gelato" forKey:@"RestaurantName"];
//        [menuItem setObject:@"none" forKey:@"primaryTag"];
//        [menuItem setObject:@"none" forKey:@"secondaryTag"];
//        [menuItem setObject:@"UWyhDFhTn6" forKey:@"restaurantID"];
//        
//        if (i <= 15)
//        {
//            [menuItem setObject:@"Appetizers" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:0] forKey:@"dishTypeNum"];
//            [menuItem setObject:[NSNumber numberWithInt:4.95] forKey:@"price"];
//        }
//        
//        else if (i <= 19)
//        {
//            [menuItem setObject:@"Soups" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:1] forKey:@"dishTypeNum"];
//            [menuItem setObject:[NSNumber numberWithInt:4.95] forKey:@"price"];
//
//
//
//        }
//        
//        else if (i <= 25)
//        {
//            [menuItem setObject:@"Salads" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:2] forKey:@"dishTypeNum"];
//
//
//        }
//        
//        else if(i <= 38)
//        {
//            [menuItem setObject:@"Sandwhiches and Burgers" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:3] forKey:@"dishTypeNum"];
//            [menuItem setObject:[NSNumber numberWithInt:9.95] forKey:@"price"];
//
//
//
//        }
//        else if(i <= 45)
//        {
//            [menuItem setObject:@"Wraps" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:4] forKey:@"dishTypeNum"];
//            
//            
//        }
//        
//        else if(i <= 55)
//        {
//            [menuItem setObject:@"Dinner Specials" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:5] forKey:@"dishTypeNum"];
//            
//            
//        }
//        
//        else if(i <= 60)
//        {
//            [menuItem setObject:@"Pastas" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:6] forKey:@"dishTypeNum"];
//            //[menuItem setObject:@"sweet" forKey:@"primaryTag"];
//            
//            
//        }
//        else if(i <= 50)
//        {
//            [menuItem setObject:@"Dolci" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:7] forKey:@"dishTypeNum"];
//            [menuItem setObject:@"sweet" forKey:@"primaryTag"];
//
//            
//        }
//        else if(i <= 52)
//        {
//            [menuItem setObject:@"Accompaniments" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:8] forKey:@"dishTypeNum"];
//            //[menuItem setObject:@"sweet" forKey:@"primaryTag"];
//            
//            
//        }
//        
//        else if(i <= 61)
//        {
//            [menuItem setObject:@"Drinks" forKey:@"dishType"];
//            [menuItem setObject:[NSNumber numberWithInt:9] forKey:@"dishTypeNum"];
//            //[menuItem setObject:@"sweet" forKey:@"primaryTag"];
//            
//            
//        }
//        
//        
//
//        [menuItem saveInBackground];
//
//    }
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CuisineCell";
    CuisineCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell configureCell:[cuisineOptions objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CuisineCell *cell = (CuisineCell *) [tableView cellForRowAtIndexPath:indexPath];
    
    NSString *selectedOption = [cuisineOptions objectAtIndex:indexPath.row];
    
    if ([selectedOptions containsObject:selectedOption])
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [selectedOptions removeObject:selectedOption];
    }
    
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [selectedOptions addObject:selectedOption];
    }
    
    
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (CuisineCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    NSString *selectedOption = [cuisineOptions objectAtIndex:indexPath.row];
    
    if ([selectedOptions containsObject:selectedOption])
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [selectedOptions removeObject:selectedOption];
    }
    
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [selectedOptions addObject:selectedOption];
    }
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cuisineOptions count];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PreferencesViewController *vc = (PreferencesViewController *)segue.destinationViewController;
    vc.cuisinePreferences = selectedOptions;
    
}

@end
