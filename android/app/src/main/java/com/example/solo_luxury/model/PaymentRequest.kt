package com.example.solo_luxury.model

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

class PaymentRequest {
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