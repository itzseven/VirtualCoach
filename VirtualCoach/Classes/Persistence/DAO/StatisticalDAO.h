//
//  StatisticalDAO.h
//  VirtualCoach
//
//  Created by Lalatiana Rakotomanana on 15/03/2016.
//  Copyright © 2016 itzseven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseService.h"

@interface StatisticalDAO : NSObject

//INSERT
-(id)insertIntoStatistical:(NSString *) cntForehand backhanh:(NSString *) cntBackhand service:(NSString *) cntService winningRun:(NSString *) win losingRun:(NSString *) lose globalSuccessRateForehand:(NSString *) forhandeRate globalSuccessRateBackhand:(NSString *) backhandRate globalSuccessRateService:(NSString *) ServiceRate day:(NSString *) d month:(NSString *) m year:(NSString *) y idPlayer:(NSString *)id;
//SELECT
-(NSArray *) allStatistical;
-(NSArray *)searchByDay:(NSString*) day Month:(NSString *) month Andyear:(NSString *) year;
-(NSArray *)searchByMonth:(NSString *) month Andyear:(NSString *) year;
-(NSArray *)searchByYear:(NSString *) year;
//UPDATE
-(id)updateServiceGlobalSuccessRate:(NSString *) gsr forDay:(NSString *) d Month:(NSString *) m andYear:(NSString *) y;
-(id)updateBackhandGlobalSuccessRate:(NSString *) gsr forDay:(NSString *) d Month:(NSString *) m andYear:(NSString *) y;
-(id)updateForeHandGlobalSuccessRate:(NSString *) gsr forDay:(NSString *) d Month:(NSString *) m andYear:(NSString *) y;
//DELETE
-(id)deleteStatisticalById:(NSString *) idStat;

@end
