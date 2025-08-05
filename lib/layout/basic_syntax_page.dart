import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteruitest/utils/basic_syntax_utils.dart';

class BasicSyntaxPage extends StatefulWidget {
  const BasicSyntaxPage({super.key});

  @override
  State<BasicSyntaxPage> createState() => _BasicSyntaxPageState();
}

class _BasicSyntaxPageState extends State<BasicSyntaxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top,),
            const Text(
              "list-数组集合的扩展运算符(...)和(...?)-[]",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700
              ),
            ),
            Row(
              children: [
                Text(
                  BasicSyntaxUtils.method1(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 50.w,),
                Text(
                  BasicSyntaxUtils.method2(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Text(
              "集合的扩展运算符与if-for",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
              ),
            ),
            Row(
              children: [
                Text(
                  BasicSyntaxUtils.method3(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 50,),
                Text(
                  BasicSyntaxUtils.method4(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Text(
              "无序集合-set-{}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
              ),
            ),
            Row(
              children: [
                Text(
                  BasicSyntaxUtils.method5(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 50,),
                Text(
                  BasicSyntaxUtils.method6(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Text(
              "值传递-引用传递",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
              ),
            ),
            Row(
              children: [
                Text(
                  BasicSyntaxUtils.method7(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 50,),
                Text(
                  BasicSyntaxUtils.method8(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Text(
              "三引号-应用-'-\"-",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(
              BasicSyntaxUtils.method9(),
              style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
            ),
            Text(
              BasicSyntaxUtils.method10(),
              style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
            ),
            const Text(
              "lambda-函数-[return_type]function_name(parameters)=>expression;",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w700
              ),
            ),
            Row(
              children: [
                Text(
                  BasicSyntaxUtils.method11(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 50,),
                Text(
                  BasicSyntaxUtils.method12(),
                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
