//
//  InspectionEveryDayDetailsViewController.h
//  GDRMGUANGSHAOMobile
//
//  Created by admin on 2019/5/13.
//

#import <UIKit/UIKit.h>
#import "DateSelectController.h"
#import "UserPickerViewController.h"

@interface InspectionEveryDayDetailsViewController : UIViewController <DatetimePickerHandler, UserPickerDelegate, UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *mineScrollview;

//保存    本日汇总数据     并创建表数据
- (IBAction)btnSaveDataClick:(id)sender;
//删除     本日汇总数据    并删除所建的表数据
- (IBAction)btnDeleteDataClick:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *date_inspectiontextfield;    //巡查日期     此表基于寻擦好日期所建

@property (weak, nonatomic) IBOutlet UITextField *inspection_miletextfield;  //当日巡查里程
@property (weak, nonatomic) IBOutlet UITextField *inspection_man_numtextfield;  //当日参加巡查人次
@property (weak, nonatomic) IBOutlet UITextField *accident_numtextfield;     //发生交通事故/其中涉及路产损害
@property (weak, nonatomic) IBOutlet UITextField *deal_accident_numtextfield;    //处理路产损害赔偿
@property (weak, nonatomic) IBOutlet UITextField *deal_bxlp_numtextfield;     //处理路产保险理赔案件
@property (weak, nonatomic) IBOutlet UITextField *fxqxtextfield;    //发现报送道路、交安设施缺陷
@property (weak, nonatomic) IBOutlet UITextField *fxwfxwtextfield;    //发现违法行为
@property (weak, nonatomic) IBOutlet UITextField *jzwfxwtextfield;    //纠正违法行为
@property (weak, nonatomic) IBOutlet UITextField *cllmzawtextfield;     //处理路面障碍物
@property (weak, nonatomic) IBOutlet UITextField *bzgzctextfield;    //帮助故障车
@property (weak, nonatomic) IBOutlet UITextField *jcsgdtextfield;   //施工检查点/纠正违反公路施工安全作业规程行为
@property (weak, nonatomic) IBOutlet UITextField *gzzfjtextfield;  //告知交通综合行政执法局处理案件
@property (weak, nonatomic) IBOutlet UITextField *fcflwstextfield;   //发出法律文书
@property (weak, nonatomic) IBOutlet UITextField *qlxrtextfield;  //劝离行人

@property (weak, nonatomic) IBOutlet UITextView *reporter_contenttextview;    //统计人意见
@property (weak, nonatomic) IBOutlet UITextView *inspection_principal_contenttextview;    //路政负责人意见  即巡查负责人意见
@property (weak, nonatomic) IBOutlet UITextView *notetextview;    //备注栏

//统计人和巡查人选择
- (IBAction)userSelectedClick:(id)sender;
//统计人和巡查人签字日期选择
- (IBAction)dateSelectedClick:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *reportertextfield;     //统计人
@property (weak, nonatomic) IBOutlet UITextField *reporter_sign_datetextfield;    //统计人签字日期

@property (weak, nonatomic) IBOutlet UITextField *inspection_principaltextfield;    //路政负责人
@property (weak, nonatomic) IBOutlet UITextField *inspection_principal_sign_datetextfield;    //负责人签字日期

@end
