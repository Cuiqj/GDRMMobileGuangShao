//
//  Inspection_Main.h
//  GDRMGUANGSHAOMobile
//
//  Created by admin on 2019/5/9.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "BaseManageObject.h"
@interface Inspection_Main : BaseManageObject

@property (nonatomic, retain) NSString * myid;       //编号
@property (nonatomic, retain) NSDate * date_inspection;     //巡查日期

@property (nonatomic, retain) NSString * inspection_principal_content;     //路政负责人意见
@property (nonatomic, retain) NSString * inspection_principal;     //路政负责人
@property (nonatomic, retain) NSDate * inspection_principal_sign_date;     //负责人签字日期
@property (nonatomic, retain) NSString * reporter_content;     //统计人意见
@property (nonatomic, retain) NSString * reporter;     //统计人
@property (nonatomic, retain) NSDate * reporter_sign_date;     //统计人签字日期

@property (nonatomic, retain) NSString * inspection_mile;     //当日巡查里程
@property (nonatomic, retain) NSString * inspection_man_num;     //当日参加巡查人次
@property (nonatomic, retain) NSString * accident_num;     //发生交通事故/其中涉及路产损害
@property (nonatomic, retain) NSString * deal_accident_num;     //处理路产损害赔偿
@property (nonatomic, retain) NSString * deal_bxlp_num;     //处理路产保险理赔案件
@property (nonatomic, retain) NSString * fxqx;     //发现报送道路、交安设施缺陷
@property (nonatomic, retain) NSString * fxwfxw;     //发现违法行为
@property (nonatomic, retain) NSString * jzwfxw;     //纠正违法行为
@property (nonatomic, retain) NSString * cllmzaw;     //处理路面障碍物
@property (nonatomic, retain) NSString * bzgzc;    //帮助故障车
@property (nonatomic, retain) NSString * jcsgd;    //施工检查点/纠正违反公路施工安全作业规程行为
@property (nonatomic, retain) NSString * gzzfj;   //告知交通综合行政执法局处理案件
@property (nonatomic, retain) NSString * fcflws;   //发出法律文书
@property (nonatomic, retain) NSString * qlxr;   //劝离行人
@property (nonatomic, retain) NSString * note;     //备注栏

@property (nonatomic, retain) NSString * remark;     //备注

@property (nonatomic, retain) NSNumber * isuploaded;


+(Inspection_Main *)inspection_mainFordate:(NSDate *)date;




@end
