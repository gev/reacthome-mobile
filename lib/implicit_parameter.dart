typedef Env = ({String value});

late Env env;

void someFunction() {
  // Access the implicit value through the top-level getter.
  print(env.value);
}

void main() {
  // Set the env record based on the environment.
  env = (value: 'Merry Christmas!'); // Setting a festive value
  someFunction();

  env = (value: 'Happy Holidays!'); // Another festive value
  someFunction();
}
