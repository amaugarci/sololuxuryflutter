package com.example.solo_luxury.model

import com.adyen.checkout.components.model.payments.Amount
import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName


class PaymentResultData {
    @SerializedName("pspReference")
    @Expose
    var pspReference: String? = null

    @SerializedName("resultCode")
    @Expose
    var resultCode: String? = null

    @SerializedName("amount")
    @Expose
    var amount: PaymentRequestAmount? = null

    @SerializedName("merchantReference")
    @Expose
    var merchantReference: String? = null
}