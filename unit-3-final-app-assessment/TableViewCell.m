//
//  TableViewCell.m
//  unit-3-final-app-assessment
//
//  Created by Natalia Estrella on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@end


@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)cellButtonTapped:(id)sender {
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Saved" message:@"New cat fact saved!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:nil];

}

@end
