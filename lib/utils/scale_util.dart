import 'package:flutter/widgets.dart';

class ScaleUtil {
  BuildContext context;

  ScaleUtil(this.context);

  scale(double size, {double minSize}) {
    print(minSize.runtimeType.toString());
    double screenWidth = MediaQuery.of(context).size.width;
    double baseWidth = 360;
    double scaledSize;
    if(minSize == null){
      if (screenWidth < baseWidth) {
        scaledSize = (screenWidth / baseWidth) * size;
        return scaledSize;
      } else {
        return size;
      }
    }
    else{
      return minSize;
    }

  }
}
