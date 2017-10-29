//
//  ICPSampleInlineMediaPlugin.m
//  Sample Inline Media Plugin
//
//  Created by Codeux Software, LLC on 10/28/17.
//  Copyright © 2017 Codeux Software, LLC. All rights reserved.
//

#import "ICPGithubCommits.h"
#import "ICPSampleInlineMediaPlugin.h"

@implementation ICPSampleInlineMediaPlugin

+ (NSArray<Class> *)modules
{
	return @[
		 [ICPGithubCommits class]
	];
}

@end
