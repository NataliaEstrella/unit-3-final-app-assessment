//
//  C4QColorPickerViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QColorPickerViewController.h"

@interface C4QColorPickerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;

@property (nonatomic) UIColor *currentColor;


@end

@implementation C4QColorPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blueButton.backgroundColor = [UIColor blueColor];
    self.greenButton.backgroundColor = [UIColor greenColor];
    self.redButton.backgroundColor = [UIColor redColor];
    
    [self.delegate didSelectColor:self.currentColor];

}
- (IBAction)redButtonTapped:(id)sender {
    self.currentColor = [UIColor redColor];
    [self.delegate didSelectColor:self.currentColor];
//    [self.delegate didSelectColor:[UIColor redColor]];

    
}

- (IBAction)greenButtonTaped:(id)sender {
    self.currentColor = [UIColor greenColor];
    [self.delegate didSelectColor:self.currentColor];

//    [self.delegate didSelectColor:[UIColor greenColor]];


}

- (IBAction)blueButtonTapped:(id)sender {
    self.currentColor = [UIColor blueColor];
    [self.delegate didSelectColor:[UIColor blueColor]];


}

@end
