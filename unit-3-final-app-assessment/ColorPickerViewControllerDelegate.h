//
//  ColorPickerViewControllerDelegate.h
//  unit-3-final-app-assessment
//
//  Created by Natalia Estrella on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@class C4QColorPickerViewController;

@protocol ColorPickerViewControllerDelegate <NSObject>

-(void)didSelectColor:(UIColor *)color;

@end
