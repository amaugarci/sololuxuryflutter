package com.example.solo_luxury

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import com.adyen.checkout.card.CardComponent
import com.adyen.checkout.card.CardConfiguration
import com.adyen.checkout.card.CardView
import com.adyen.checkout.components.PaymentComponentProvider
import com.adyen.checkout.components.model.paymentmethods.PaymentMethod
import com.example.solo_luxury.apiservice.APIClient
import com.example.solo_luxury.inerface.ApiInterface
import com.example.solo_luxury.model.PaymentRequest
import com.example.solo_luxury.model.PaymentRequestAmount
import com.example.solo_luxury.paymentmethod.PaymentMethodData
import com.google.gson.Gson
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class CardActivity : AppCompatActivity() {

    var apiInterface: ApiInterface? = null
    var paymentMethodRequest = PaymentMethod()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_card)

        apiInterface = APIClient().getRetroClient().create(ApiInterface::class.java)

        val paymentRequestAmount = PaymentRequestAmount()
        paymentRequestAmount.currency = "EUR"
        paymentRequestAmount.value = 100

        val paymentRequest = PaymentRequest()
        paymentRequest.merchantAccount = "MioModaFzeECOM"
        paymentRequest.shopperReference = ""
        paymentRequest.amount = paymentRequestAmount
        paymentRequest.countryCode = "IN"
        paymentRequest.shopperLocale = "en-US"
        paymentRequest.channel = "android"
        paymentRequest.splitCardFundingSources = false


        Log.e("TAG", "onCreate: -> ${apiInterface} ");
        val call: Call<PaymentMethodData> = apiInterface!!.getApiData(paymentRequest)

        call.enqueue(object : Callback<PaymentMethodData?> {
            override fun onResponse(call: Call<PaymentMethodData?>, response: Response<PaymentMethodData?>) {
                if (response.isSuccessful) {
                    Log.e("onResponse", "onResponse: Response Data ==> ${Gson().toJson(response.body())} ")
                    val responsePayments: PaymentMethodData = response.body()!!
                    paymentMethodRequest.type = responsePayments.paymentMethods!![0].type
                    paymentMethodRequest.brands = responsePayments.paymentMethods!![0].brands
                    paymentMethodRequest.name = responsePayments.paymentMethods!![0].name
                    paymentMethodRequest.brand = null
                    paymentMethodRequest.fundingSource = null
                    paymentMethodRequest.issuers = null
                    paymentMethodRequest.configuration = null
                    paymentMethodRequest.details = null

                    Log.e("TAG", "paymentMethod: ${paymentMethodRequest}");

                    val cardConfiguration = CardConfiguration.Builder(this@CardActivity, "test_V2YCCMRAGVEELCXFN2TEMZSSUIHHMI5O") .build()
                    val cardComponent = CardComponent.PROVIDER.get(this@CardActivity, paymentMethodRequest, cardConfiguration)
                    findViewById<CardView>(R.id.payment_card).attach(cardComponent, this@CardActivity)
                    cardComponent.observe(this@CardActivity) { paymentComponentState ->
                        if (paymentComponentState.isValid) {
                            Log.e("TAG", "onCreate: paymentComponentState " + paymentComponentState.isValid);
                            // When the shopper proceeds to pay, pass the `paymentComponentState.data` to your server to send a /payments request
//                sendPayment(paymentComponentState.data)
                        }
                    }


//                    setupCardView(responsePayments)
                } else {
                    Log.e("onResponse", "onResponse: code ==> ${Gson().toJson(response.code())} ")
                }
            }

            override fun onFailure(call: Call<PaymentMethodData?>, t: Throwable) {
                Log.e("onResponse", "onResponse: message ==> ${Gson().toJson(t.message)} ");
            }

        })

    }


//    private fun setupCardView(paymentMethod: PaymentMethodData) {
//        Log.e("paymentMethod -> ", paymentMethod.toString());
//        val cardComponent = CardComponent.PROVIDER.get(
//                this,
//                paymentMethod,
//                checkoutConfigurationProvider.getCardConfiguration()
//        )
////
////        binding.cardView.attach(cardComponent, this)
////
////        cardComponent.observe(this, cardViewModel::onCardComponentState)
////        cardComponent.observeErrors(this, cardViewModel::onComponentError)
//    }

}
