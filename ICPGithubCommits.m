//
//  ICPGithubCommits.m
//  Sample Inline Media Plugin
//
//  Created by Codeux Software, LLC on 10/28/17.
//  Copyright © 2017 Codeux Software, LLC. All rights reserved.
//

#import "ICPGithubCommits.h"

@implementation ICPGithubCommits

- (void)_performAction
{
	/* You can access the original URL in the payload.
	 You can also modify its contents to have the
	 result treated differently. */
	ICLPayloadMutable *payload = self.payload;

	NSDictionary *templateAttributes =
	@{
	  @"uniqueIdentifier" : payload.uniqueIdentifier,
	};

	NSError *templateRenderError = nil;

	NSString *html = [self.template renderObject:templateAttributes error:&templateRenderError];

	if (html) {
		/* The -html property is non-nil */

		payload.html = html;
	}

	[self finalizeWithError:templateRenderError];
}

+ (nullable SEL)actionForURL:(NSURL *)url
{
	/*
	 if ( URL WE ARE NOT INTERESTED IN ) {
		 return nil;
	 }
	*/

	return @selector(_performAction);
}

+ (nullable ICLInlineContentModuleActionBlock)actionBlockForURL:(NSURL *)url
{
	/* You don't have to define this method unless you intend to use it.
	 It is present in this subclass to show that it exists.
	 See ICLInlineContentModule.h for description. */

	return nil;
}

+ (NSArray<NSString *> *)domains
{
	return @[
		 @"github.com",
		 @"www.github.com"
	];
}

- (nullable NSArray<NSURL *> *)styleResources
{
	/* The main NSBundle will always be the host service because
	 plugins are loaded into same memory of the service.
	 You therefore have to find the bundle for this class if you
	 want to access any resources that it comes with. */
	return @[
		[[NSBundle bundleForClass:self.class] URLForResource:@"ICPGithubCommits" withExtension:@"css"]
	];
}

- (nullable NSArray<NSURL *> *)scriptResources
{
	/* You don't have to define this method unless you intend to use it.
	 It is present in this subclass to show that it exists.
	 See ICLInlineContentModule.h for description. */

	return nil;
}

- (nullable NSURL *)templateURL
{
	return [[NSBundle bundleForClass:self.class] URLForResource:@"ICPGithubCommits" withExtension:@"mustache"];
}

- (nullable NSString *)entrypoint
{
	/* You don't have to define this method unless you intend to use it.
	 It is present in this subclass to show that it exists.
	 See ICLInlineContentModule.h for description. */

	return nil;
}

+ (BOOL)contentUntrusted
{
	/* You don't have to define this method unless you intend to use it.
	 It is present in this subclass to show that it exists.
	 See ICLInlineContentModule.h for description. */

	return NO;
}

+ (BOOL)contentImageOrVideo
{
	/* You don't have to define this method unless you intend to use it.
	 It is present in this subclass to show that it exists.
	 See ICLInlineContentModule.h for description. */

	return NO;
}

+ (BOOL)contentNotSafeForWork
{
	/* You don't have to define this method unless you intend to use it.
	 It is present in this subclass to show that it exists.
	 See ICLInlineContentModule.h for description. */

	return NO;
}

@end
