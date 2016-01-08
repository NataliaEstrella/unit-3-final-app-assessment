//
//  TableViewCell.h
//  unit-3-final-app-assessment
//
//  Created by Natalia Estrella on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "C4QCatFactsTableViewController.h"

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *factLabel;

@property (weak, nonatomic) IBOutlet UIButton *cellButton;


@end
