package com.example.solo_luxury.inerface

import com.adyen.checkout.googlepay.model.PaymentDataRequestModel
import com.example.solo_luxury.model.JsonPayRequestData
import com.example.solo_luxury.model.PaymentMethodRequest
import com.example.solo_luxury.model.PaymentResultData
import com.example.solo_luxury.paymentmethod.PaymentMethodData
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST


interface ApiInterface {
    @Headers("x-API-key: AQElhmfuXNWTK0Qc+iSdm2sVqOCabpFILytlPUDKLMF/TD8NExA0nRDBXVsNvuR83LVYjEgiTGAH-XOKLayz1nQo5PruYFh0xsMgYVXu0L7OksKRMkPXP6TI=-7BmHX&8(<7tRDmtI")
    @POST("paymentMethods")
    fun getApiData(@Body paymentMethodRequest: PaymentMethodRequest): Call<PaymentMethodData>

    @Headers("x-API-key: AQElhmfuXNWTK0Qc+iSdm2sVqOCabpFILytlPUDKLMF/TD8NExA0nRDBXVsNvuR83LVYjEgiTGAH-XOKLayz1nQo5PruYFh0xsMgYVXu0L7OksKRMkPXP6TI=-7BmHX&8(<7tRDmtI")
    @POST("payments")
    fun getPayRequestApiData(@Body paymentRequest: JsonPayRequestData): Call<PaymentResultData>
}