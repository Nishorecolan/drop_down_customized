import 'package:flutter/material.dart';
import 'package:ui_sample/widget_helper.dart';

class EmailUs extends StatelessWidget {
   EmailUs({super.key});

  var categories = ['College','University','Diplomo'];
   TextEditingController selectedPolicyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: buildText(name: 'Email Us'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
                radius: 12,
                child: Icon(Icons.question_mark, size: 18)),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(0, 255, 255, 255),
                  Color.fromARGB(100, 133, 177, 232)
                ],
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  buildText(
                      name: 'Let\'s get in touch.',
                      fontColor: Color(0xff0D3C59),
                      fontFamily: 'Alda Pro',
                      fontSize: 28),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: buildText(
                          name:
                              'Use the contact form below and we’ll have the right person respond to you.', fontColor: Color(0xff58656D))),
                  const SizedBox(height: 35),
                  buildDropdownField(hintText: 'Select a Policy'),
                  const SizedBox(height: 30),
                  buildDropdownField(hintText: 'Select a Topic'),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 8),
                    child: TextField(
                      maxLines: 5,
                      maxLength: 2000,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter your message here.',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildDropdownField(hintText: 'Preferred Contact Method'),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, bottom: 30, right: 8, left: 8),
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                       //   action: SnackBarAction(label: 'Value', onPressed: () {  },),
                            dismissDirection: DismissDirection.up,
                            content: Text('Submit button Pressed')));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child:
                                buildText(name: 'Submit', fontColor: Color(0xffFFFFFF), fontWeight: FontWeight.w500, fontSize: 16)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

   buildText(
       {String name = '',
         double fontSize = 14,
         FontWeight fontWeight = FontWeight.w400,
         String fontFamily = 'Effra',
         textAlign = TextAlign.center,
         Color fontColor = Colors.black}) {
     return Text(name,
         textAlign: textAlign,
         style: TextStyle(
             fontFamily: fontFamily,
             fontSize: fontSize,
             fontWeight: fontWeight,
             color: fontColor));
   }

  Widget buildDropdownField1({hintText = 'Select one'}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 8, right: 8, left: 8),
      child: DropdownButtonFormField(items: categories.map((String category) {
        return DropdownMenuItem(
            value: category,
            child: Text(category),
        );
      }).toList(),
          icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 30,),
          decoration: InputDecoration(
              errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 16.0),
              hintText: hintText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          onChanged: (val){}),
    );
  }

   Widget buildDropdownField({hintText}) {
     return SizedBox(
         height: 50,
         child: LayoutBuilder(
             builder: (context, constraints) => CustomizeDropdown(
                 context,
                 dropdownItems: categories,
                 controller: selectedPolicyController,
                 hintText: hintText,
                 width: double.infinity,
                 optionsViewBuilder: (BuildContext context,
                     AutocompleteOnSelected onSelected, Iterable options) {
                   return buildDropDownContainer(
                     context,
                     options: options,
                     onSelected: onSelected,
                     dropdownData: categories,
                     constraints: constraints,
                     dropDownHeight: options.first == 'No Data Found'
                         ? 150
                         : options.length < 5
                         ? options.length * 50
                         : 200,
                   );
                 },
                 validation: (val) {
                   return null;
                 },
                 onChanged: (val) async {

                 },
                 onSelected: (val) {
                   print('seleccted $val');
                   // setState(() {
                   //   selectedPolicy = val;
                   // });
                 },
                 onSubmitted: (val) {
                   // setState(() {
                   //   selectedPolicy = val;
                   // });
                 }

             )));
   }
}