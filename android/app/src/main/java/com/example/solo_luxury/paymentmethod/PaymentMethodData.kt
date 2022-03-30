package com.example.solo_luxury.paymentmethod

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

class PaymentMethodData {
    @SerializedName("paymentMethods")
    @Expose
    var paymentMethods: List<PaymentMethod>? = null
}

class PaymentMethod {
    @SerializedName("brands")
    @Expose
    var brands: List<String>? = null

    @SerializedName("name")
    @Expose
    var name: String? = null

    @SerializedName("type")
    @Expose
    var type: String? = null
}

