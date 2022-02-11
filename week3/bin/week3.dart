import 'package:week3/week3.dart' as week3;
import 'package:week3/advanced_classes.dart' as advanced_classes;

void main(List<String> arguments) {
  var u3 = week3.User3(id: 1, username: "sagar", password: "weakpw");
  // print(u3._id); // * ERROR: _id is private
  week3.constructors();
  week3.privateVarsGetterSetters();
  week3.staticVars();
  advanced_classes.inheritance();
  advanced_classes.mixins();
  advanced_classes.interfaces();
  advanced_classes.extensions();
}
