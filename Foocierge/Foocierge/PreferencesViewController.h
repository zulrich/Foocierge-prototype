//
//  PreferencesViewController.h
//  Foocierge
//
//  Created by Zack Ulrich on 8/19/13.
//  Copyright (c) 2013 Zack Ulrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreferencesViewController : UIViewController<UIScrollViewDelegate>

{
    __weak IBOutlet UIScrollView *scrollView;
    
    __weak IBOutlet UISegmentedControl *spicySegment;
    __weak IBOutlet UISegmentedControl *sweetSegment;
    __weak IBOutlet UISegmentedControl *savorySegment;
    
    __weak IBOutlet UISegmentedControl *organicSegment;
    
    __weak IBOutlet UISegmentedControl *seafoodSegment;
    
    __weak IBOutlet UISegmentedControl *saltySegment;
    
    __weak IBOutlet UISegmentedControl *priceSegment;
}
- (IBAction)segmentChanged:(id)sender;

@property (nonatomic, strong) NSArray *cuisinePreferences;

@end
