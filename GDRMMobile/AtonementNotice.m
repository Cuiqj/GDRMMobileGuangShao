//
//  AtonementNotice.m
//  GDRMMobile
//
//  Created by yu hongwu on 12-11-15.
//
//

#import "AtonementNotice.h"
#import "Systype.h"

@implementation AtonementNotice

@dynamic myid;
@dynamic caseinfo_id;
@dynamic citizen_name;
@dynamic code;
@dynamic date_send;
@dynamic check_organization;
@dynamic case_desc;
@dynamic witness;
@dynamic pay_reason;
@dynamic pay_mode;
@dynamic organization_id;
@dynamic remark;
@dynamic isuploaded;

- (NSString *) signStr{
    if (![self.caseinfo_id isEmpty]) {
        return [NSString stringWithFormat:@"caseinfo_id == %@", self.caseinfo_id];
    }else{
        return @"";
    }
}

+ (NSArray *)AtonementNoticesForCase:(NSString *)caseID{
    NSManagedObjectContext *context=[[AppDelegate App] managedObjectContext];
    NSEntityDescription *entity=[NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"caseinfo_id==%@",caseID];
    fetchRequest.predicate=predicate;
    fetchRequest.entity=entity;
    return [context executeFetchRequest:fetchRequest error:nil];
}

- (NSString *)organization_info_part1{
    return [[self subString2:self.organization_id] objectAtIndex:0];
}
- (NSString *)organization_info_part2{
    //return [[self subString2:self.organization_id] objectAtIndex:1];
    return [self.organization_id   stringByReplacingOccurrencesOfString:self.organization_info_part1 withString:@""];
}
- (NSString *)bank_name{
    return [[Systype typeValueForCodeName:@"交款地点"] objectAtIndex:0];
}
- (NSString *)organization_info{
    return self.organization_id ;
}
-(NSArray *) subString2:(NSString *)str {
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    if (str != nil){
        
        //从开始截取到指定索引字符   但不包含此字符  。
        NSString * tempStr1 = [str substringToIndex:str.length/2];
        
        //从指定字符串截取到末尾
        NSString * tempStr2 = [str substringFromIndex:str.length/2+1];
        
        [array addObject:tempStr1];
        
        [array addObject:tempStr2];
    }
    
    return array;
}
-(NSString *)new_case_desc{
    NSArray *temp=[self.case_desc componentsSeparatedByString:@"分"];
    return [temp objectAtIndex:1];
}
-(NSString *)new_pay_reason{
    //    NSArray *temp=[self.pay_reason componentsSeparatedByString:@"根据"];
    //    NSString * ss=[temp objectAtIndex:1];
    //    NSArray *temp2=[ss componentsSeparatedByString:@"的规定"];
    //    return [temp2 objectAtIndex:0];
    return self.pay_reason;
}
@end
