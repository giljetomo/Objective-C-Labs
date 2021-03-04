//
//  PaymentGateway.h
//  Lab10 - Payments
//
//  Created by Gil Jetomo on 2021-03-03.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PaymentDelegate <NSObject>

- (void)processPaymentAmount:(float) amount;
- (BOOL)canProcessPayment;

@end

@interface PaymentGateway : NSObject
@property (nonatomic, weak)id<PaymentDelegate> delegate;

- (void)processPaymentAmount:(float) payment;

@end

NS_ASSUME_NONNULL_END
