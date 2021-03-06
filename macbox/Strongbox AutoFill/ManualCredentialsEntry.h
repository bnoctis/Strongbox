//
//  ManualCredentialsEntry.h
//  Strongbox AutoFill
//
//  Created by Strongbox on 16/11/2020.
//  Copyright © 2020 Mark McGuill. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DatabaseMetadata.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManualCredentialsEntry : NSViewController

@property BOOL isAutoFillOpen;
@property DatabaseMetadata* database;

@property (nonatomic, copy) void (^onDone)(BOOL userCancelled, NSString*_Nullable password, NSString*_Nullable keyFileBookmark, YubiKeyConfiguration*_Nullable yubiKeyConfiguration);

@end

NS_ASSUME_NONNULL_END
