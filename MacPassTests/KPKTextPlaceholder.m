//
//  KPKTextPlaceholder.m
//  MacPass
//
//  Created by Michael Starke on 15.08.13.
//  Copyright (c) 2013 HicknHack Software GmbH. All rights reserved.
//

#import "KPKTextPlaceholder.h"
#import "KPKEntry.h"
#import "KPKAttribute.h"

#import "NSString+CommandString.h"

@implementation KPKTextPlaceholder

- (void)testPlaceholder {
  KPKEntry *entry = [[KPKEntry alloc] init];
  entry.title = @"TestTitle";
  entry.username = @"TestUsername";
  entry.notes = @"TestNotes";
  entry.url = @"TestURL";
  entry.password = @"TestPassword";
  KPKAttribute *attribute = [[KPKAttribute alloc] initWithKey:@"extended" value:@"valueForExtended"];
  [entry addCustomAttribute:attribute];
  
  NSString *placeholder = @"{USERNAME}{PASSWORD}{NOTHING}{URL}{S:extended}";
  NSString *evaluated = [placeholder evaluatePlaceholderWithEntry:entry];
  NSString *evaluatedGoal = [NSString stringWithFormat:@"%@%@{NOTHING}%@%@", entry.username, entry.password, entry.url, attribute.value];
  STAssertTrue([evaluated isEqualToString:evaluatedGoal], @"Evaluated string must match");
}

@end