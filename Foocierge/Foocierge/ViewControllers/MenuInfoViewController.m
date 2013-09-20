//
//  MenuInfoViewController.m
//  Foocierge
//
//  Created by Zack Ulrich on 8/22/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import "MenuInfoViewController.h"

@interface MenuInfoViewController ()

@end

@implementation MenuInfoViewController

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
    
    self.itemNameLabel.text = self.selectedMenuItem.name;
    self.titleBarItem.title = self.selectedMenuItem.name;
    
    NSString *string = [NSString stringWithFormat:@"Add Item $%@", self.selectedMenuItem.price];
    self.addItemBarItem.title = string;
    
    self.describitionTextView.text = self.selectedMenuItem.describition;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addPressed:(id)sender
{
    [self.addItemDelegate menuItemAdded:self.selectedMenuItem];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
