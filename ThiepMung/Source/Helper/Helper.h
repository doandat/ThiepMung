//
//  Helper.h
//  MedisafeRD
//
//  Created by Exlinct on 1/26/16.
//  Copyright © 2016 Ominext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helper : NSObject

+ (NSDateFormatter *)dateFormatter;

+ (NSString *)convertStringMonthFromNumber:(NSInteger)month;
//+ (NSArray *)arrStringDayFromDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year;
//+ (NSArray *)arrSevenDayFromDate:(NSDate *)date;

+ (NSDate *)calculateDateFromDate:(NSDate *)date offset:(int)offset;

+ (NSString *)convertStringFromDate:(NSDate *)currentDay;

+ (NSString *)convertStringWeekFromDate:(NSDate *)date;

+ (NSDate *)beginOfWeekWithDate:(NSDate *)date;
+ (NSDate *)endOfWeekWithDate:(NSDate *)date;

+ (void)showViewController:(UIViewController *)dialogViewController inViewController:(UIViewController *)aViewController withSize:(CGSize)size;
+ (void)showViewController:(UIViewController *)dialogViewController inViewController:(UIViewController *)aViewController withFrame:(CGRect )frame;
+ (void)showViewController:(UIViewController *)dialogViewController withTag:(NSInteger)tag inViewController:(UIViewController *)aViewController withFrame:(CGRect )frame;


+ (void)showViewController:(UIViewController *)dialogViewController inViewController:(UIViewController *)aViewController;
+ (void)showViewController:(UIViewController*)dialogViewController inViewController:(UIViewController*)aViewController marginX:(int)margin_x marginY:(int)margin_y;
+ (void)removeDialogViewController:(UIViewController*)superViewController;
+ (void)removeDialogViewController:(UIViewController*)superViewController withTagDialogViewController:(NSInteger)tagDialogVC;

+ (void)showViewControllerNoMargrinY:(UIViewController*)dialogViewController inViewController:(UIViewController*)aViewController marginX:(int)margin_x ;

@end
