import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopping/generated/l10n.dart';
import 'package:shopping/main.dart'; // ملف الترجمة

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Help),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Title(
              color: Colors.grey,
              child: Image.asset(
                "images/nn.webp",
                width: 50.w,
                height: 50.h,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).Faq,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              ExpansionTile(
                title: Text(S.of(context).How_do_I_add_items_to_cart),
                children: [
                  Text(
                    S.of(context).Find_the_item_you_want_to_add,
                  ),
                  Text(
                    S.of(context).Click_the_Add_to_Cart_button,
                  ),
                  Text(
                    S.of(context).Optional_Select_the_quantity_you_want,
                  ),
                  Text(
                    S.of(context).Cc,
                  ),
                  Text(
                    S.of(context).comments,
                  ),
                  Text(
                    S.of(context).a,
                  ),
                  Text(
                    S.of(context).b,
                  ),
                  Text(
                    S.of(context).c,
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(S.of(context).How_do_I_check_out),
                children: [
                  Text(
                    S.of(context).z,
                  ),
                  Text(
                    S.of(context).x,
                  ),
                  Text(
                    S.of(context).v,
                  ),
                  Text(
                    S.of(context).B,
                  ),
                  Text(
                    S.of(context).n,
                  ),
                  Text(
                    S.of(context).m,
                  ),
                  Text(
                    S.of(context).A,
                  ),
                  Text(
                    S.of(context).comments,
                  ),
                  Text(
                    S.of(context).s,
                  ),
                  Text(
                    S.of(context).d,
                  ),
                  Text(
                    S.of(context).f,
                  ),
                ],
              ),
              ExpansionTile(
                title:
                    Text(S.of(context).What_is_the_shipping_and_return_policy),
                children: [
                  Text(
                    S.of(context).Shipping_and_return_policy_explanation,
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(S.of(context).How_do_I_contact_customer_support),
                children: [
                  Text(
                    S.of(context).Contacting_customer_support_explanation,
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Text(
                S.of(context).User_Manual,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  // فتح دليل المستخدم (يمكنك استخدام رابط أو ملف PDF)
                },
                child: Text(S.of(context).Open_User_Manual),
              ),
              SizedBox(height: 32.h),
              Text(
                S.of(context).Contact_Us,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  // فتح نموذج الاتصال أو بريد إلكتروني أو رقم هاتف
                },
                child: Text(S.of(context).Contact_Customer_Support),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
