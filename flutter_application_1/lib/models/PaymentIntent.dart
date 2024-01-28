import 'package:stripe_platform_interface/stripe_platform_interface.dart' as sp;

class PaymentIntent implements sp.PaymentIntent {  @override
  // TODO: implement amount
  num get amount => throw UnimplementedError();

  @override
  // TODO: implement canceledAt
  String? get canceledAt => throw UnimplementedError();

  @override
  // TODO: implement captureMethod
  sp.CaptureMethod get captureMethod => throw UnimplementedError();

  @override
  // TODO: implement clientSecret
  String get clientSecret => throw UnimplementedError();

  @override
  // TODO: implement confirmationMethod
  sp.ConfirmationMethod get confirmationMethod => throw UnimplementedError();

  @override
  // TODO: implement copyWith
  sp.$PaymentIntentCopyWith<sp.PaymentIntent> get copyWith => throw UnimplementedError();

  @override
  // TODO: implement created
  String get created => throw UnimplementedError();

  @override
  // TODO: implement currency
  String get currency => throw UnimplementedError();

  @override
  // TODO: implement description
  String? get description => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement livemode
  bool get livemode => throw UnimplementedError();

  @override
  // TODO: implement mandateData
  sp.MandateData? get mandateData => throw UnimplementedError();

  @override
  // TODO: implement nextAction
  sp.NextAction? get nextAction => throw UnimplementedError();

  @override
  // TODO: implement paymentMethodId
  String? get paymentMethodId => throw UnimplementedError();

  @override
  // TODO: implement receiptEmail
  String? get receiptEmail => throw UnimplementedError();

  @override
  // TODO: implement shipping
  sp.ShippingDetails? get shipping => throw UnimplementedError();

  @override
  // TODO: implement status
  sp.PaymentIntentsStatus get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
