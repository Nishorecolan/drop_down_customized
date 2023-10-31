import 'dart:async';
// import 'dart:html';

import 'package:flutter/material.dart';

List<String> emptyDataList = ['No Data Found'];

Widget CustomizeDropdown(
    BuildContext context,
    {FutureOr<Iterable<Object>> Function(TextEditingValue)?  optionsBuilder,
      String Function(Object)? displayStringForOption,hintText,displayName,optionsViewBuilder,onChanged,
      onSubmitted,void Function(Object)? onSelected,double? width,TextEditingController? controller,
      Widget Function(BuildContext, TextEditingController, FocusNode, void Function())? fieldViewBuilder,
      String? helperText,String? Function(String?)? validation,double? height,bool? isEnable,fillColor,
      displayText,focusNode,List<String>? dropdownItems,double? dropdownHeight, inputFormatters, isSubmitClicked = false}) {
  FocusNode focusNode = FocusNode();
  String storedData = '';
  bool fieldValidation= false;
  TextEditingController widthController = TextEditingController();
  String widthData="";
  String hintData="";
  // if(kIsWeb){
  //   hintData='';
  // }
  print(controller!.text.isEmpty && isSubmitClicked);
  print(controller!.text);
  print(isSubmitClicked);
  return StatefulBuilder(
      builder: (context,setState) {
        focusNode.addListener(() {
          setState((){
            fieldValidation = focusNode.hasFocus;
          });
        });
        return Container(
          // width: width ?? getScreenWidth(context) * 0.90,
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color: controller!.text.isEmpty && isSubmitClicked ? Color(0xffC02321) : Colors.black)),
            child: Autocomplete(

                optionsBuilder: optionsBuilder ?? (TextEditingValue textEditingValue) {
                  if(dropdownItems!.isEmpty) {
                    return emptyDataList;
                  }
                  if(textEditingValue.text.isEmpty && dropdownItems.isNotEmpty) {
                   return dropdownItems.where((element) => element.toLowerCase().toString().contains(textEditingValue.text.toLowerCase()));
                  }
                  if(dropdownItems.where((element) => element.toLowerCase().toString().contains(textEditingValue.text.toLowerCase())).isEmpty)  {
                   return emptyDataList;
                  } else {
                   return dropdownItems.where((element) => element.toLowerCase().toString().contains(textEditingValue.text.toLowerCase()));
                  }
                  //return [''];
                },
                displayStringForOption: displayStringForOption ?? (option) => '$option',
                fieldViewBuilder: fieldViewBuilder ?? (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  fieldTextEditingController.addListener(() {
                    // if(fieldTextEditingController.text == S
                    //     .of(context)
                    //     .statuswithout || fieldTextEditingController.text == "Receiver Country"){
                    //   setState((){
                    //     fieldFocusNode.unfocus();
                    //     focusNode.unfocus();
                    //   });
                    // }

                  });
                  // kIsWeb? widthController.addListener(() {
                  //   if(widthData != widthController.text){
                  //
                  //     if(fieldTextEditingController.text.isEmpty) {
                  //       if (dropdownItems!.contains(hintData)) {
                  //         fieldTextEditingController.text = hintData;
                  //       }
                  //     }
                  //     fieldFocusNode.unfocus();
                  //   }
                  // }):null;
                  //widthController.text = getScreenWidth(context).toString();
                  fieldTextEditingController.addListener(() {
                    if(dropdownItems!.contains(fieldTextEditingController.text)){
                      focusNode.unfocus();
                    }
                  });
                  return Container(
                    height: height,
                    child: Focus(
                      focusNode: focusNode,
                      onFocusChange: (hasFocus) {
                        if(!hasFocus){

                          if(dropdownItems!.contains(fieldTextEditingController.text)){
                            fieldTextEditingController.text = fieldTextEditingController.text;
                            // if(manageReceiverNotifier == null)controller!.text = fieldTextEditingController.text;
                            storedData = fieldTextEditingController.text;
                            hintData = fieldTextEditingController.text;
                            // if(fieldTextEditingController.text == S
                            //     .of(context)
                            //     .statuswithout || fieldTextEditingController.text == "Receiver Country"){
                            //   setState((){
                            //     fieldTextEditingController.clear();
                            //     controller!.clear();
                            //   });
                            // }

                          }else{
                            fieldTextEditingController.text = storedData.isEmpty? '' : storedData;
                          }

                        }else{
                          setState((){
                            if(controller!.text.isNotEmpty){
                              storedData = controller.text;
                              hintData = controller.text;
                              fieldTextEditingController.clear();
                              controller.clear();
                            } else {
                              storedData = fieldTextEditingController.text;
                              hintData = fieldTextEditingController.text;
                              fieldTextEditingController.clear();
                              controller.clear();
                            }
                          });
                        }
                      },
                      child: TextFormField(

                        enabled: isEnable,
                        controller: controller!.text.isEmpty
                            ? fieldTextEditingController
                            : controller,
                        //controller: fieldTextEditingController,
                        onEditingComplete: (){

                          List<String> dropdownItemsLowercase = dropdownItems!.map((e) => e.toLowerCase()).toList();
                          if(dropdownItemsLowercase.contains(fieldTextEditingController.text.toLowerCase())){

                            dropdownItems.forEach((element) {

                              if(element.toLowerCase() == fieldTextEditingController.text.toLowerCase()){

                                fieldTextEditingController.text = element;
                                focusNode.unfocus();
                              }
                            });
                          }else{

                            fieldTextEditingController.text = storedData.isEmpty? '' : storedData;
                            focusNode.unfocus();
                          }
                        },
                        onFieldSubmitted: onSubmitted,
                        focusNode: fieldFocusNode,
                        inputFormatters: inputFormatters ?? [],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator:  fieldValidation?(value){return null;}:validation ??
                        //
                        //         (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return fieldValidation?null:'field is required';
                        //       }
                        //       return null;
                        //     },
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Field is required';
                        //   }
                        //   return null; // Return null to indicate no error
                        // },

                        decoration: InputDecoration(
                          helperText: helperText,
                          // contentPadding: EdgeInsets.only(left: 15,top: 8,bottom: 12),
                          contentPadding: EdgeInsets.all(17),
                          isDense: true,
                          // contentPadding: EdgeInsets.only(top: 18,bottom: 18,left: 20),
                          // contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 20), // Adjust the vertical padding as needed

                          // hintText: storedData.isNotEmpty ? storedData : 'select',
                          // hintText: hintText,
                         labelText: hintText,
                          labelStyle: TextStyle(color: controller!.text.isEmpty && isSubmitClicked ? Color(0xffC02321) :  Color(0xff58656D)),
                          //   hintStyle: hintStyle(context),
                          errorMaxLines: 4,
                          // errorStyle: focusNode.hasFocus?TextStyle(height: 0.1,fontSize: 0.1,color: Colors.transparent):TextStyle(color: errorTextField,
                          //     fontSize: 11.5,fontWeight: FontWeight.w500),
                          // errorBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.red),
                          //     borderRadius: BorderRadius.circular(5)),
                          // focusedErrorBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.blue),
                          //     borderRadius: BorderRadius.circular(5)),
                          // focusedBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.green),
                          //     borderRadius: BorderRadius.circular(5)),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.yellow)),
                          // disabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.orange)),
                          fillColor: fillColor ?? Colors.white,
                          filled: true,
                          hoverColor: Colors.white,
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          suffixIcon: fieldValidation ? Padding(
                            padding: const EdgeInsets.only(right: 19.0),
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Image.asset('assets/arrow-down.png',
                                color: Color(0xff292D32), width: 10, height: 20,),
                            ),
                          ) : Padding(
                            padding: const EdgeInsets.only(right: 19.0),
                            child: Image.asset('assets/arrow-down.png',
                              color: Color(0xff292D32), width: 10, height: 20,),
                          ),
                        ),

                        onChanged: onChanged,


                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                  );

                },
                onSelected: onSelected,
                optionsViewBuilder: optionsViewBuilder
            )
        );
      }
  );
}

Widget buildDropDownContainer(BuildContext context,
    {required options,required onSelected,required List<String> dropdownData,
      constraints,
      double? dropDownHeight,
      double? dropDownWidth,
    }) {
  ScrollController scrollController = ScrollController();
  return Align(
    alignment: Alignment.topLeft,
    child: Scrollbar(
      controller: scrollController,
      thumbVisibility: options.length < 3 ? false : true,
      child: Material(
        child: Container(
          width: dropDownWidth ?? constraints.biggest.width,
          height: dropDownHeight,
          // height: 20,
          decoration: BoxDecoration(border: Border.all(color: Colors.black38),
           //color: Color(0xffF5F8FA),
          ),
          child: ListView.builder(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(10.0),
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              // var option = options.elementAt(index);
              String option = options.elementAt(index);
              print('options are $option');
              List<String> parts = option.split('#');
              print(" option:==>"+parts.toString());
              return InkWell(
                  // hoverColor:  option == 'no Data Found' ? Colors.transparent : Colors.red.shade300,
                  //hoverColor:   Colors.red,
                  //hoverColor:  isHovered == true ? Colors.red :Colors.yellow,
               // highlightColor: Colors.yellow,
                //  highlightColor: option == S.of(context).noDataFound ? Colors.transparent : null,
                //  splashColor: option == S.of(context).noDataFound ? Colors.transparent : null,
                // splashColor: Colors.red.shade300,
                onTap: () {
                  if(option == 'No Data Found') {

                  }
                  else {
                    onSelected(option);
                  }

                },
                onHover: (val) {
                   // isHovered = val;
                },
                //  mouseCursor:  option == S.of(context).noDataFound ? SystemMouseCursors.none : SystemMouseCursors.click,
                child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: dropdownData.isEmpty ||  option == 'No Data Found'
                        ? Column(
                        children: [
                          SizedBox(height: 35),
                          Text(option),
                        ])
                        // : Text(option,style: TextStyle(fontSize: 16),)
                        // : Text('${option.substring(0,option.length - 3)}',style: TextStyle(fontSize: 16),)
                        : Text('${parts[0]}',style: TextStyle(fontSize: 16),)
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}