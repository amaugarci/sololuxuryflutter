package com.example.solo_luxury.model

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName


class PaymentMethodRequest {
    @SerializedName("merchantAccount")
    @Expose
    var merchantAccount: String? = null

    @SerializedName("shopperReference")
    @Expose
    var shopperReference: String? = null

    @SerializedName("amount")
    @Expose
    var amount: PaymentRequestAmount? = null

    @SerializedName("countryCode")
    @Expose
    var countryCode: String? = null

    @SerializedName("shopperLocale")
    @Expose
    var shopperLocale: String? = null

    @SerializedName("channel")
    @Expose
    var channel: String? = null

    @SerializedName("splitCardFundingSources")
    @Expose
    var splitCardFundingSources: Boolean? = null
}

class PaymentRequestAmount {
    @SerializedName("currency")
    @Expose
    var currency: String? = null

    @SerializedName("value")
    @Expose
    var value: Int? = null
}


//Payment request

class JsonPayRequestData {
    @SerializedName("paymentMethod")
    @Expose
    var paymentMethod: EncryptedData? = null

    @SerializedName("storePaymentMethod")
    @Expose
    var storePaymentMethod: Boolean? = null

    @SerializedName("shopperReference")
    @Expose
    var shopperReference: String? = null

    @SerializedName("amount")
    @Expose
    var amount: PaymentRequestAmount? = null

    @SerializedName("merchantAccount")
    @Expose
    var merchantAccount: String? = null

    @SerializedName("returnUrl")
    @Expose
    var returnUrl: String? = null

    @SerializedName("countryCode")
    @Expose
    var countryCode: String? = null

    @SerializedName("shopperIP")
    @Expose
    var shopperIP: String? = null

    @SerializedName("reference")
    @Expose
    var reference: String? = null

    @SerializedName("channel")
    @Expose
    var channel: String? = null

    @SerializedName("additionalData")
    @Expose
    var additionalData: AdditionalData? = null

    @SerializedName("lineItems")
    @Expose
    var lineItems: List<LineItem>? = null

    @SerializedName("threeDSAuthenticationOnly")
    @Expose
    var threeDSAuthenticationOnly: Boolean? = null

    @SerializedName("threeDS2RequestData")
    @Expose
    var threeDS2RequestData: ThreeDS2RequestData? = null
}

class CardData {
    @SerializedName("paymentMethod")
    @Expose
    var paymentMethod: EncryptedData? = null

    @SerializedName("storePaymentMethod")
    @Expose
    var storePaymentMethod: Boolean? = null
}

class EncryptedData {
    @SerializedName("encryptedCardNumber")
    @Expose
    var encryptedCardNumber: String? = null

    @SerializedName("encryptedExpiryMonth")
    @Expose
    var encryptedExpiryMonth: String? = null

    @SerializedName("encryptedExpiryYear")
    @Expose
    var encryptedExpiryYear: String? = null

    @SerializedName("encryptedSecurityCode")
    @Expose
    var encryptedSecurityCode: String? = null

    @SerializedName("threeDS2SdkVersion")
    @Expose
    var threeDS2SdkVersion: String? = null

    @SerializedName("type")
    @Expose
    var type: String? = null
}

class AdditionalData {
    @SerializedName("allow3DS2")
    @Expose
    var allow3DS2: Boolean? = null

    @SerializedName("executeThreeD")
    @Expose
    var executeThreeD: Boolean? = null
}

class ThreeDS2RequestData {
    @SerializedName("deviceChannel")
    @Expose
    var deviceChannel: String? = null

    @SerializedName("challengeIndicator")
    @Expose
    var challengeIndicator: String? = null
}

class LineItem {
    @SerializedName("quantity")
    @Expose
    var quantity: Int? = null

    @SerializedName("amountExcludingTax")
    @Expose
    var amountExcludingTax: Int? = null

    @SerializedName("taxPercentage")
    @Expose
    var taxPercentage: Int? = null

    @SerializedName("description")
    @Expose
    var description: String? = null

    @SerializedName("id")
    @Expose
    var id: String? = null

    @SerializedName("amountIncludingTax")
    @Expose
    var amountIncludingTax: Double? = null

    @SerializedName("taxCategory")
    @Expose
    var taxCategory: String? = null
}

