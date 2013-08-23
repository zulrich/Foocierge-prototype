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
