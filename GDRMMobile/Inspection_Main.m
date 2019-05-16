//
//  Inspection_Main.m
//  GDRMGUANGSHAOMobile
//
//  Created by admin on 2019/5/9.
//

#import "Inspection_Main.h"
@implementation Inspection_Main

@dynamic myid;
@dynamic date_inspection;
@dynamic inspection_principal_content;
@dynamic inspection_principal;
@dynamic inspection_principal_sign_date;
@dynamic reporter_content;
@dynamic reporter;
@dynamic reporter_sign_date;
@dynamic inspection_mile;
@dynamic inspection_man_num;
@dynamic accident_num;
@dynamic deal_accident_num;
@dynamic deal_bxlp_num;
@dynamic fxqx;
@dynamic fxwfxw;
@dynamic jzwfxw;
@dynamic cllmzaw;
@dynamic bzgzc;
@dynamic jcsgd;
@dynamic gzzfj;
@dynamic fcflws;
@dynamic qlxr;
@dynamic note;
@dynamic remark;
@dynamic isuploaded;


+(Inspection_Main *)inspection_mainFordate:(NSDate *)date{
    NSManagedObjectContext *context=[[AppDelegate App] managedObjectContext];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Inspection_Main" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"date_inspection == %@",date];
    fetchRequest.predicate=predicate;
    fetchRequest.entity=entity;
    NSArray *fetchResult=[context executeFetchRequest:fetchRequest error:nil];
    if (fetchResult.count>0) {
        return [fetchResult objectAtIndex:0];
    } else {
        return nil;
    }
}





@end
