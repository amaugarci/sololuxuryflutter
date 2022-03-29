package com.example.solo_luxury.model

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

class CardComponentsData {
    @SerializedName("nameValuePairs")
    @Expose
    var nameValuePairs: NameValuePairs? = null
}

class NameValuePairs {
    @SerializedName("paymentMethod")
    @Expose
    var paymentMethod: PaymentMethod? = null

    @SerializedName("storePaymentMethod")
    @Expose
    var storePaymentMethod: Boolean? = null
}

class NameValuePairs__1 {
    @SerializedName("type")
    @Expose
    var type: String? = null

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
}

class PaymentMethod {
    @SerializedName("nameValuePairs")
    @Expose
    var nameValuePairs: NameValuePairs__1? = null
}