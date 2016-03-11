//
//  AppService.m
//  ThiepMung
//
//  Created by Doan Dat on 3/11/16.
//  Copyright © 2016 Amobi. All rights reserved.
//

#import "AppService.h"

@implementation AppService

+(NSDictionary*)getDicFromUrlString:(NSString *)urlString
{
    NSError *err = nil;
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url options:NSDataReadingMappedAlways error:&err];
    if (err) {
        return nil;
    }
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &err];
    if (err) {
        return nil;
    }
    return dic;
}

+ (NSArray *) getDCategoryFromUrlString:(NSString *)urlString{
    NSMutableArray *arrDCategory = [[NSMutableArray alloc]init];
    NSDictionary *dicDCategory = [self getDicFromUrlString:urlString];
    if (dicDCategory) {
        NSDictionary *dicDCategoryList = [dicDCategory objectForKey:k_category_list];
        if (dicDCategoryList) {
            for (NSDictionary *dicDCateogty1 in dicDCategoryList) {
                DCategory *dCategory = [DCategory new];
                dCategory.dCategory_id = [dicDCateogty1 objectForKey:k_id];
                dCategory.dCategory_name = [dicDCateogty1 objectForKey:k_name];
                [arrDCategory addObject:dCategory];
            }
        }
    }
    
    return arrDCategory;
}

+ (NSArray *) getEffectListWithCategoryId:(NSString *)dCategoryId{
    NSMutableArray *arrDEffect = [[NSMutableArray alloc]init];
    NSString *stringURL =[NSString stringWithFormat:@"%@?%@=%@",URL_GET_EFFECT_LIST,p_category_id,dCategoryId];
    NSLog(@"stringURL:%@",stringURL);
    NSDictionary *dicDEffect = [self getDicFromUrlString:[NSString stringWithFormat:@"%@?%@=%@",URL_GET_EFFECT_LIST,p_category_id,dCategoryId]];
    if (dicDEffect) {
        NSDictionary *dicDEffectList = [dicDEffect objectForKey:k_effect_list];
        if (dicDEffectList) {
            for (NSDictionary *dicDEffect1 in dicDEffectList) {
                DEffect *dEffect = [DEffect new];
                NSDictionary *dicInputLine = [dicDEffect1 objectForKey:k_input_line];
                NSDictionary *dicInputPic = [dicDEffect1 objectForKey:k_input_picture];
                
                dEffect.dEffect_id = [dicDEffect1 objectForKey:k_id];
                dEffect.label = [dicDEffect1 objectForKey:k_label];
                dEffect.effectDescription = [dicDEffect1 objectForKey:k_description];
                dEffect.function = [dicDEffect1 objectForKey:k_function];
                dEffect.avatar = [dicDEffect1 objectForKey:k_avatar];
                if (dicInputLine) {
                    NSMutableArray *arrInputLine = [[NSMutableArray alloc]init];
                    for (NSDictionary *dicInputLine1 in dicInputLine) {
                        DInputLine *dInputLine = [DInputLine new];
                        dInputLine.type = [dicInputLine1 objectForKey:k_type];
                        dInputLine.title = [dicInputLine1 objectForKey:k_title];
                        dInputLine.require = [dicInputLine1 objectForKey:k_require];
                        [arrInputLine addObject:dInputLine];
                    }
                    dEffect.input_line = arrInputLine;
                }
                
                if (dicInputPic) {
                    NSMutableArray *arrInputPic = [[NSMutableArray alloc]init];
                    for (NSDictionary *dicInputPic1 in dicInputLine) {
                        DInputPic *dInputPic = [DInputPic new];
                        dInputPic.type = [dicInputPic1 objectForKey:k_type];
                        dInputPic.require = [dicInputPic1 objectForKey:k_require];
                        dInputPic.width = [dicInputPic1 objectForKey:k_width];
                        dInputPic.height = [dicInputPic1 objectForKey:k_height];
                        [arrInputPic addObject:dInputPic];
                    }
                    dEffect.input_pic = arrInputPic;
                }
                
                [arrDEffect addObject:dEffect];
                
            }
        }
    }
    return arrDEffect;
}



@end
