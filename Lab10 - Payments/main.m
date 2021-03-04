//
//  main.m
//  Lab10 - Payments
//
//  Created by Gil Jetomo on 2021-03-03.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "PaymentGateway.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "PaypalPaymentService.h"
#import "Payment.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    while (TRUE) {
      float cost = arc4random_uniform(1001) + 100;
      NSString *input = [InputHandler prompt:[NSString stringWithFormat:
                                              @"\nThank you for shopping at Acme.com. "
                                              "Your total today is $%.2f. "
                                              "\nPlease select your payment method:\n"
                                              "1 - Paypal\n"
                                              "2 - Stripe\n"
                                              "3 - Amazon\n"
                                              "4 - ApplePay\n"
                                              "5 - Cancel",cost] andSize:255];
      NSInteger paymentAmount = [input integerValue];
      
      if (paymentAmount > 0 && paymentAmount < 6) {
        if (paymentAmount == 5) {
          break;
        }
        //factory design pattern
        NSArray *classNames = @[@"PaypalPaymentService", @"StripePaymentService", @"AmazonPaymentService", @"ApplePaymentService"];
        Payment *paymentMethod = [NSClassFromString(classNames[paymentAmount - 1]) new];
        
        //delegate design pattern
        PaymentGateway *paymentGateway = [PaymentGateway new];
        paymentGateway.delegate = paymentMethod;
        [paymentGateway processPaymentAmount:cost];
      }
    }
  }
  return 0;
}
