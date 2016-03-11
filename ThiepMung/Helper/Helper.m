//
//  Helper.m
//  MedisafeRD
//
//  Created by Exlinct on 1/26/16.
//  Copyright © 2016 Ominext. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (NSString *)convertStringMonthFromNumber:(NSInteger)month{
    switch (month) {
        case 1:
            return @"Jan";
            break;
        case 2:
            return @"Feb";
            break;
        case 3:
            return @"Mar";
            break;
        case 4:
            return @"Apr";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"Jun";
            break;
        case 7:
            return @"Jul";
            break;
        case 8:
            return @"Aug";
            break;
        case 9:
            return @"Sep";
            break;
        case 10:
            return @"Oct";
            break;
        case 11:
            return @"Nov";
            break;
        case 12:
            return @"Dec";
            break;
        default:
            return @"";
            break;
    }
}
/*
+ (NSArray *)arrStringDayFromDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year{
    NSMutableArray *arrStringDay = [[NSMutableArray alloc]init];
    switch (month) {
        case 1:
            if (day == 1) {
                [arrStringDay addObject:@"31 Dec"];
                [arrStringDay addObject:@"1 Jan"];
                [arrStringDay addObject:@"2 Jan"];
            }else if (day == 31){
                [arrStringDay addObject:@"30 Jan"];
                [arrStringDay addObject:@"31 Jan"];
                [arrStringDay addObject:@"1 Feb"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Jan",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Jan",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Jan",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            break;
        case 2:
            
            if (day == 1) {
                [arrStringDay addObject:@"31 Jan"];
                [arrStringDay addObject:@"1 Feb"];
                [arrStringDay addObject:@"2 Feb"];
            }else{
                if (((year%4==0) && (year%100 != 0))||(year%400==0)) {
                    //năm nhuận
                    if (day == 29){
                        NSLog(@"Năm nhuận day 29:");
                        [arrStringDay addObject:@"28 Feb"];
                        [arrStringDay addObject:@"29 Feb"];
                        [arrStringDay addObject:@"1 Mar"];
                    }else{
                        NSLog(@"Năm nhuận day != 29:");

                        NSString *preDay = [NSString stringWithFormat:@"%i Feb",day-1];
                        NSString *toDay = [NSString stringWithFormat:@"%i Feb",day];
                        NSString *nextDay = [NSString stringWithFormat:@"%i Feb",day+1];
                        
                        [arrStringDay addObject:preDay];
                        [arrStringDay addObject:toDay];
                        [arrStringDay addObject:nextDay];
                    }
                }else{
                    //không phải năm nhuận
                    if (day == 28){
                        [arrStringDay addObject:@"27 Feb"];
                        [arrStringDay addObject:@"28 Feb"];
                        [arrStringDay addObject:@"1 Mar"];
                    }else{
                        NSString *preDay = [NSString stringWithFormat:@"%i Feb",day-1];
                        NSString *toDay = [NSString stringWithFormat:@"%i Feb",day];
                        NSString *nextDay = [NSString stringWithFormat:@"%i Feb",day+1];
                        
                        [arrStringDay addObject:preDay];
                        [arrStringDay addObject:toDay];
                        [arrStringDay addObject:nextDay];
                    }
                }
            }
            //            return @"Feb";
            break;
        case 3:
            if (day == 1) {
                if (((year%4==0) && (year%100 != 0))||(year%400==0)) {
                    [arrStringDay addObject:@"29 Feb"];
                    [arrStringDay addObject:@"1 Mar"];
                    [arrStringDay addObject:@"2 Mar"];
                }else{
                    [arrStringDay addObject:@"28	 Feb"];
                    [arrStringDay addObject:@"1 Mar"];
                    [arrStringDay addObject:@"2 Mar"];
                }
            }else if (day == 31){
                [arrStringDay addObject:@"30 Mar"];
                [arrStringDay addObject:@"31 Mar"];
                [arrStringDay addObject:@"1 Apr"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Mar",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Mar",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Mar",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"Mar";
            break;
        case 4:
            if (day == 1) {
                [arrStringDay addObject:@"31 Mar"];
                [arrStringDay addObject:@"1 Apr"];
                [arrStringDay addObject:@"2 Apr"];
            }else if (day == 30){
                [arrStringDay addObject:@"29 Apr"];
                [arrStringDay addObject:@"30 Apr"];
                [arrStringDay addObject:@"1 May"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Apr",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Apr",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Apr",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"Apr";
            break;
        case 5:
            if (day == 1) {
                [arrStringDay addObject:@"31 Apr"];
                [arrStringDay addObject:@"1 May"];
                [arrStringDay addObject:@"2 May"];
            }else if (day == 31){
                [arrStringDay addObject:@"30 May"];
                [arrStringDay addObject:@"31 May"];
                [arrStringDay addObject:@"1 Jun"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i May",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i May",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i May",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"May";
            break;
        case 6:
            if (day == 1) {
                [arrStringDay addObject:@"31 May"];
                [arrStringDay addObject:@"1 Jun"];
                [arrStringDay addObject:@"2 Jun"];
            }else if (day == 30){
                [arrStringDay addObject:@"29 Jun"];
                [arrStringDay addObject:@"30 Jun"];
                [arrStringDay addObject:@"1 Jul"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Jun",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Jun",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Jun",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"Jun";
            break;
        case 7:
            if (day == 1) {
                [arrStringDay addObject:@"31 Jun"];
                [arrStringDay addObject:@"1 Jul"];
                [arrStringDay addObject:@"2 Jul"];
            }else if (day == 31){
                [arrStringDay addObject:@"30 Jul"];
                [arrStringDay addObject:@"31 Jul"];
                [arrStringDay addObject:@"1 Aug"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Jul",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Jul",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Jul",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"Jul";
            break;
        case 8:
            if (day == 1) {
                [arrStringDay addObject:@"31 Jul"];
                [arrStringDay addObject:@"1 Aug"];
                [arrStringDay addObject:@"2 Aug"];
            }else if (day == 31){
                [arrStringDay addObject:@"30 Aug"];
                [arrStringDay addObject:@"31 Aug"];
                [arrStringDay addObject:@"1 Sep"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Aug",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Aug",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Aug",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"Aug";
            break;
        case 9:
            if (day == 1) {
                [arrStringDay addObject:@"31 Aug"];
                [arrStringDay addObject:@"1 Sep"];
                [arrStringDay addObject:@"2 Sep"];
            }else if (day == 30){
                [arrStringDay addObject:@"29 Sep"];
                [arrStringDay addObject:@"30 Sep"];
                [arrStringDay addObject:@"1 Oct"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Sep",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Sep",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Sep",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"Sep";
            break;
        case 10:
            if (day == 1) {
                [arrStringDay addObject:@"31 Sep"];
                [arrStringDay addObject:@"1 Oct"];
                [arrStringDay addObject:@"2 Oct"];
            }else if (day == 31){
                [arrStringDay addObject:@"30 Oct"];
                [arrStringDay addObject:@"31 Oct"];
                [arrStringDay addObject:@"1 Mar"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Oct",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Oct",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Oct",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"Oct";
            break;
        case 11:
            if (day == 1) {
                [arrStringDay addObject:@"31 Oct"];
                [arrStringDay addObject:@"1 Nov"];
                [arrStringDay addObject:@"2 Nov"];
            }else if (day == 30){
                [arrStringDay addObject:@"29 Nov"];
                [arrStringDay addObject:@"30 Nov"];
                [arrStringDay addObject:@"1 Dec"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Nov",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Nov",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Nov",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"Nov";
            break;
        case 12:
            if (day == 1) {
                [arrStringDay addObject:@"31 Nov"];
                [arrStringDay addObject:@"1 Dec"];
                [arrStringDay addObject:@"2 Dec"];
            }else if (day == 31){
                [arrStringDay addObject:@"30 Dec"];
                [arrStringDay addObject:@"31 Dec"];
                [arrStringDay addObject:@"1 Jan"];
            }else{
                NSString *preDay = [NSString stringWithFormat:@"%i Dec",day-1];
                NSString *toDay = [NSString stringWithFormat:@"%i Dec",day];
                NSString *nextDay = [NSString stringWithFormat:@"%i Dec",day+1];
                
                [arrStringDay addObject:preDay];
                [arrStringDay addObject:toDay];
                [arrStringDay addObject:nextDay];
            }
            //            return @"Dec";
            break;
        default:
            break;
    }
    return arrStringDay;
}
*/

+ (NSDateFormatter *)dateFormatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    dateFormatter.dateFormat = @"dd-MM-yyyy HH:mm";
    return dateFormatter;
}


/*
//+ (NSArray *)arrSevenDayFromDate:(NSDate *)date{
//    NSMutableArray *arrSevenDay = [[NSMutableArray alloc]init];
//    
//    NSUInteger units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay| NSCalendarUnitHour| NSCalendarUnitMinute;
//    NSDateComponents *comps = [[NSCalendar currentCalendar] components:units fromDate:date];
//    comps.day= comps.day-3;
//    
//    [arrSevenDay addObject:@""];
//    for (int i=1; i<=7; i++) {
//        NSDate *dateTmp =[[NSCalendar currentCalendar] dateFromComponents:comps];
//        comps = [[NSCalendar currentCalendar] components:units fromDate:dateTmp];
//        [arrSevenDay addObject:[NSString stringWithFormat:@"%i %@",comps.day,[self convertStringMonthFromNumber:comps.month]]];
//        comps.day++;
//    }
//    [arrSevenDay addObject:@""];
//    
//    return arrSevenDay;
//}
*/

+ (NSDate *)calculateDateFromDate:(NSDate *)date offset:(int)offset{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *dateTmp = [cal dateByAddingUnit:NSCalendarUnitDay value:offset toDate:date options:0];

    
    return dateTmp;
}

+ (NSString *)convertStringFromDate:(NSDate *)date{
    NSUInteger units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay| NSCalendarUnitHour| NSCalendarUnitMinute;
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:units fromDate:date];
    
    return [NSString stringWithFormat:@"%i %@",comps.day,[self convertStringMonthFromNumber:comps.month]];
}


+ (NSString *)convertStringWeekFromDate:(NSDate *)date{
    NSUInteger units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay| NSCalendarUnitHour| NSCalendarUnitMinute;
    NSDateComponents *compsBegin = [[NSCalendar currentCalendar] components:units fromDate:[self beginOfWeekWithDate:date]];
    NSDateComponents *compsEnd = [[NSCalendar currentCalendar] components:units fromDate:[self endOfWeekWithDate:date]];

    return [NSString stringWithFormat:@"%i %@ - %i %@",compsBegin.day,[self convertStringMonthFromNumber:compsBegin.month],compsEnd.day,[self convertStringMonthFromNumber:compsEnd.month]];

}

+ (NSDate *)beginOfWeekWithDate:(NSDate *)date{
    //Week Start Date
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    
    int dayofweek = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:date] weekday];// this will give you current day of week
    [components setDay:([components day] - ((dayofweek) - 2))];// for beginning of the week.
    
    NSDate *beginningOfWeek = [cal dateFromComponents:components];
    
    NSLog(@"%@", [[Helper dateFormatter] stringFromDate:beginningOfWeek]);
    return beginningOfWeek;
}
+ (NSDate *)endOfWeekWithDate:(NSDate *)date{
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *componentsEnd = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    
    int enddayofweek = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:date] weekday];// this will give you current day of week
    
    [componentsEnd setDay:([componentsEnd day]+(7-enddayofweek)+1)];// for end day of the week
    
    NSDate *endOfWeek = [cal dateFromComponents:componentsEnd];
    
    
    NSLog(@"%@", [[Helper dateFormatter] stringFromDate:endOfWeek]);
    return endOfWeek;

}

///////
+ (void)showViewController:(UIViewController *)dialogViewController inViewController:(UIViewController *)aViewController withSize:(CGSize)size{
    UIViewController *loadingViewController = [[UIViewController alloc]init];
    loadingViewController.view.frame = CGRectMake(0, 0, aViewController.view.bounds.size.width, aViewController.view.bounds.size.height);
    loadingViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
    loadingViewController.view.tag = 1000;
    
    
    CGRect frameChildView = dialogViewController.view.frame;
    CGRect frameFatherView = aViewController.view.frame;
    //    frame.origin.x = (aViewController.view.frame.size.width - frame.size.width)/2;
    //    frame.origin.y = (aViewController.view.frame.size.height - frame.size.height)/2;
    frameChildView = CGRectMake((frameFatherView.size.width - size.width)/2, (frameFatherView.size.height - size.height)/2, size.width , size.height);
    //    frameChildView = CGRectMake(margin_x, margin_y, dialogViewController.view.frame.size.width, dialogViewController.view.frame.size.height);
    dialogViewController.view.center = loadingViewController.view.center;
    dialogViewController.view.frame = frameChildView;
    [loadingViewController addChildViewController:dialogViewController];
    [loadingViewController.view addSubview:dialogViewController.view];
    [aViewController addChildViewController:loadingViewController];
    [aViewController.view addSubview:loadingViewController.view];
}

+ (void)showViewController:(UIViewController *)dialogViewController inViewController:(UIViewController *)aViewController withFrame:(CGRect )frame{
    UIViewController *loadingViewController = [[UIViewController alloc]init];
    loadingViewController.view.frame = CGRectMake(0, 0, aViewController.view.bounds.size.width, aViewController.view.bounds.size.height);
    loadingViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.08];
    loadingViewController.view.tag = 1000;
    
    
    CGRect frameChildView = dialogViewController.view.frame;
    __unused CGRect frameFatherView = aViewController.view.frame;
    //    frame.origin.x = (aViewController.view.frame.size.width - frame.size.width)/2;
    //    frame.origin.y = (aViewController.view.frame.size.height - frame.size.height)/2;
    
    frameChildView = frame;
    
    dialogViewController.view.center = loadingViewController.view.center;
    dialogViewController.view.frame = frameChildView;
    dialogViewController.view.tag = 1001;
    [loadingViewController addChildViewController:dialogViewController];
    [loadingViewController.view addSubview:dialogViewController.view];
    [aViewController addChildViewController:loadingViewController];
    [aViewController.view addSubview:loadingViewController.view];
}

+ (void)showViewController:(UIViewController *)dialogViewController withTag:(NSInteger)tag inViewController:(UIViewController *)aViewController withFrame:(CGRect )frame{
    UIViewController *loadingViewController = [[UIViewController alloc]init];
    loadingViewController.view.frame = CGRectMake(0, 0, aViewController.view.bounds.size.width, aViewController.view.bounds.size.height);
    loadingViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.08];
    loadingViewController.view.tag = tag;
    
    
    CGRect frameChildView = dialogViewController.view.frame;
    __unused CGRect frameFatherView = aViewController.view.frame;
    //    frame.origin.x = (aViewController.view.frame.size.width - frame.size.width)/2;
    //    frame.origin.y = (aViewController.view.frame.size.height - frame.size.height)/2;
    
    frameChildView = frame;
    
    dialogViewController.view.center = loadingViewController.view.center;
    dialogViewController.view.frame = frameChildView;
    dialogViewController.view.tag = tag+1;
    [loadingViewController addChildViewController:dialogViewController];
    [loadingViewController.view addSubview:dialogViewController.view];
    [aViewController addChildViewController:loadingViewController];
    [aViewController.view addSubview:loadingViewController.view];
}

+(void)showViewController:(UIViewController *)dialogViewController inViewController:(UIViewController *)aViewController{
    UIViewController *loadingViewController = [[UIViewController alloc]init];
    loadingViewController.view.frame = CGRectMake(0, 0, aViewController.view.bounds.size.width, aViewController.view.bounds.size.height);
    loadingViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    loadingViewController.view.tag = 1000;
    
    CGRect frameChildView = dialogViewController.view.frame;
    CGRect frameFatherView = aViewController.view.frame;
    //    frame.origin.x = (aViewController.view.frame.size.width - frame.size.width)/2;
    //    frame.origin.y = (aViewController.view.frame.size.height - frame.size.height)/2;
    frameChildView = CGRectMake(0, 0, frameFatherView.size.width , frameFatherView.size.height);
    //    frameChildView = CGRectMake(margin_x, margin_y, dialogViewController.view.frame.size.width, dialogViewController.view.frame.size.height);
    //    dialogViewController.view.center = loadingViewController.view.center;
    dialogViewController.view.frame = frameChildView;
    [loadingViewController addChildViewController:dialogViewController];
    [loadingViewController.view addSubview:dialogViewController.view];
    [aViewController addChildViewController:loadingViewController];
    [aViewController.view addSubview:loadingViewController.view];
}

+ (void)showViewController:(UIViewController*)dialogViewController inViewController:(UIViewController*)aViewController marginX:(int)margin_x marginY:(int)margin_y{
    UIViewController *loadingViewController = [[UIViewController alloc]init];
    loadingViewController.view.frame = CGRectMake(0, 0, aViewController.view.bounds.size.width, aViewController.view.bounds.size.height);
    loadingViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    loadingViewController.view.tag = 1000;
    
    
    CGRect frameChildView = dialogViewController.view.frame;
    __unused CGRect frameFatherView = aViewController.view.frame;
    //    frame.origin.x = (aViewController.view.frame.size.width - frame.size.width)/2;
    //    frame.origin.y = (aViewController.view.frame.size.height - frame.size.height)/2;
    
    frameChildView = CGRectMake(margin_x, margin_y, aViewController.view.frame.size.width - 2*margin_x, aViewController.view.frame.size.height - 2*margin_y);
    
    dialogViewController.view.center = loadingViewController.view.center;
    dialogViewController.view.frame = frameChildView;
    [loadingViewController addChildViewController:dialogViewController];
    [loadingViewController.view addSubview:dialogViewController.view];
    [aViewController addChildViewController:loadingViewController];
    [aViewController.view addSubview:loadingViewController.view];
}

+ (void)showViewControllerNoMargrinY:(UIViewController*)dialogViewController inViewController:(UIViewController*)aViewController marginX:(int)margin_x {
    
    UIViewController *loadingViewController = [[UIViewController alloc]init];
    loadingViewController.view.frame = CGRectMake(0, 0, aViewController.view.bounds.size.width, aViewController.view.bounds.size.height);
    loadingViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    loadingViewController.view.tag = 1000;
    
    
    CGRect frameChildView = dialogViewController.view.frame;
    __unused CGRect frameFatherView = aViewController.view.frame;
    //    frame.origin.x = (aViewController.view.frame.size.width - frame.size.width)/2;
    //    frame.origin.y = (aViewController.view.frame.size.height - frame.size.height)/2;
    
    frameChildView = CGRectMake(margin_x, (aViewController.view.frame.size.width - 200)*1.25 , aViewController.view.frame.size.width - 2*margin_x, 210);
    
    dialogViewController.view.center = loadingViewController.view.center;
    dialogViewController.view.frame = frameChildView;
    [loadingViewController addChildViewController:dialogViewController];
    [loadingViewController.view addSubview:dialogViewController.view];
    [aViewController addChildViewController:loadingViewController];
    [aViewController.view addSubview:loadingViewController.view];
    
    
}

+ (void)removeDialogViewController:(UIViewController*)superViewController{
    for (UIViewController *aViewController in superViewController.childViewControllers) {
        if (aViewController.view.tag == 1000 && [aViewController isKindOfClass:[UIViewController class]]) {
            [aViewController removeFromParentViewController];
            [aViewController.view removeFromSuperview];
        }
    }
}

+ (void)removeDialogViewController:(UIViewController*)superViewController withTagDialogViewController:(NSInteger)tagDialogVC{
    for (UIViewController *aViewController in superViewController.childViewControllers) {
        if (aViewController.view.tag == tagDialogVC && [aViewController isKindOfClass:[UIViewController class]]) {
            [aViewController removeFromParentViewController];
            [aViewController.view removeFromSuperview];
        }
    }
}
@end
