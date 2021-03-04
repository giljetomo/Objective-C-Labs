//
//  Payment.h
//  Lab10 - Payments
//
//  Created by Gil Jetomo on 2021-03-03.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"

NS_ASSUME_NONNULL_BEGIN

@interface Payment : NSObject <PaymentDelegate>
- (void)processPaymentAmount:(float)amount;
- (BOOL)canProcessPayment;
@end

NS_ASSUME_NONNULL_END
