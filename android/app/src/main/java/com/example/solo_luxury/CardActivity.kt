package com.example.solo_luxury

import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.adyen.checkout.card.CardComponent
import com.adyen.checkout.card.CardConfiguration
import com.adyen.checkout.card.CardView
import com.adyen.checkout.components.model.paymentmethods.PaymentMethod
import com.adyen.checkout.components.model.payments.request.PaymentComponentData
import com.example.solo_luxury.apiservice.APIClient
import com.example.solo_luxury.inerface.ApiInterface
import com.example.solo_luxury.model.*
import com.example.solo_luxury.paymentmethod.PaymentMethodData
import com.google.gson.Gson
import org.json.JSONObject
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

        getCardUI()

    }

    private fun getCardUI() {
        val paymentRequestAmount = PaymentRequestAmount()
        paymentRequestAmount.currency = "EUR"
        paymentRequestAmount.value = 100

        val paymentRequest = PaymentMethodRequest()
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

                    setupCardView(paymentMethodRequest)


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


    private fun setupCardView(paymentMethod: PaymentMethod) {
        val cardConfiguration = CardConfiguration.Builder(this@CardActivity, "test_V2YCCMRAGVEELCXFN2TEMZSSUIHHMI5O").build()
        val cardComponent = CardComponent.PROVIDER.get(this@CardActivity, paymentMethod, cardConfiguration)
        findViewById<CardView>(R.id.payment_card).attach(cardComponent, this@CardActivity)
        cardComponent.observe(this@CardActivity) { paymentComponentState ->
            if (paymentComponentState.isValid) {
                makePayment(paymentComponentState.data)
                Log.e("TAG", "onCreate: paymentComponentState " + Gson().toJson(paymentComponentState.data))
                // When the shopper proceeds to pay, pass the `paymentComponentState.data` to your server to send a /payments request
//                sendPayment(paymentComponentState.data)
            }
        }
    }

    private fun makePayment(data: PaymentComponentData<*>) {
        Log.e("Chintan", "makePayment: $data")

        val paymentComponentData = PaymentComponentData.SERIALIZER.serialize(data)
        findViewById<Button>(R.id.pay_button).setOnClickListener {
            postPayment(paymentComponentData)
        }


//        viewModelScope.launch(Dispatchers.IO) {
//            val paymentRequest = createPaymentRequest(
//                    paymentComponentData,
//                    keyValueStorage.getShopperReference(),
//                    keyValueStorage.getAmount(),
//                    keyValueStorage.getCountry(),
//                    keyValueStorage.getMerchantAccount(),
//                    // Should be set correctly for additional actions
//                    "",
//                    AdditionalData(
//                            allow3DS2 = keyValueStorage.isThreeds2Enable().toString(),
//                            executeThreeD = keyValueStorage.isExecuteThreeD().toString()
//                    )
//            )
//            Log.e("Chintan", "paymentRequest: $paymentRequest" )
//
//            val requestBody = paymentRequest.toString().toRequestBody("application/json".toMediaType())
//            Log.e("Chintan", "requestBody: $requestBody" )
//
//            handlePaymentResponse(paymentsRepository.paymentsRequestAsync(requestBody))
//        }
    }

    private fun postPayment(paymentComponentData: JSONObject) {


        val jsonString = Gson().toJson(paymentComponentData)
        Log.e("TAG", "postPayment: $jsonString");
        val cardComponentsData: CardComponentsData = Gson().fromJson(jsonString, CardComponentsData::class.java)




        val paymentRequestAmount = PaymentRequestAmount()
        paymentRequestAmount.currency = "EUR"
        paymentRequestAmount.value = 100


        val encryptedData = EncryptedData()
        encryptedData.type = cardComponentsData.nameValuePairs?.paymentMethod?.nameValuePairs?.type
        encryptedData.encryptedCardNumber = cardComponentsData.nameValuePairs?.paymentMethod?.nameValuePairs?.encryptedCardNumber
        encryptedData.encryptedExpiryMonth = cardComponentsData.nameValuePairs?.paymentMethod?.nameValuePairs?.encryptedExpiryMonth
        encryptedData.encryptedExpiryYear = cardComponentsData.nameValuePairs?.paymentMethod?.nameValuePairs?.encryptedExpiryYear
        encryptedData.encryptedSecurityCode = cardComponentsData.nameValuePairs?.paymentMethod?.nameValuePairs?.encryptedSecurityCode
        encryptedData.threeDS2SdkVersion = cardComponentsData.nameValuePairs?.paymentMethod?.nameValuePairs?.threeDS2SdkVersion

        Log.e("Chintan", "paymentMethod: ${encryptedData}");
        Log.e("Chintan", "paymentMethod: ${Gson().toJson(encryptedData)}");

        val jsonPayRequestData = JsonPayRequestData()
        jsonPayRequestData.paymentMethod = encryptedData
        jsonPayRequestData.storePaymentMethod = cardComponentsData.nameValuePairs?.storePaymentMethod
        jsonPayRequestData.shopperReference=""
        jsonPayRequestData.amount = paymentRequestAmount
        jsonPayRequestData.merchantAccount = "MioModaFzeECOM"
        jsonPayRequestData.returnUrl=""
        jsonPayRequestData.countryCode = "IN"
        jsonPayRequestData.shopperIP = "142.12.31.22"
        jsonPayRequestData.reference =  "android-test-components_1648528151746"
        jsonPayRequestData.channel = "android"

        val additionalData = AdditionalData()
        additionalData.allow3DS2 = true
        additionalData.executeThreeD = false
        jsonPayRequestData.additionalData = additionalData

        jsonPayRequestData.threeDSAuthenticationOnly = false
        val lineItems = LineItem()
        lineItems.quantity = 2
        lineItems.amountExcludingTax = 100
        lineItems.taxPercentage= 0
        lineItems.description = "Coffee"
        lineItems.id = "1648528151894"
        lineItems.amountIncludingTax= 100
        lineItems.taxCategory= "Low"
        jsonPayRequestData.lineItems = listOf(lineItems)

        val threeDS2RequestData = ThreeDS2RequestData()
        threeDS2RequestData.deviceChannel = "app"
        threeDS2RequestData.challengeIndicator = "requestChallenge"


        Log.e("Chintan", "jsonPayRequestData: -> " + jsonPayRequestData.toString());
        val call: Call<PaymentResultData> = apiInterface!!.getPayRequestApiData(jsonPayRequestData)

        call.enqueue(object : Callback<PaymentResultData?> {
            override fun onResponse(call: Call<PaymentResultData?>, response: Response<PaymentResultData?>) {
                if (response.isSuccessful) {
                    Log.e("onResponse", "onResponse: Response Data ==> ${Gson().toJson(response.body())} ")


                    val responsePayments: PaymentResultData = response.body()!!
                    MainActivity.result?.success(Gson().toJson(responsePayments));
                    onBackPressed()

                    Log.e("TAG", "paymentMethod: ${paymentMethodRequest}");


                } else {
                    Log.e("onResponse", "onResponse: code ==> ${Gson().toJson(response.code())} ")
                }
            }

            override fun onFailure(call: Call<PaymentResultData?>, t: Throwable) {
                Log.e("onResponse", "onResponse: message ==> ${Gson().toJson(t.message)} ");
            }

        })
    }

}
